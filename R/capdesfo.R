#' @name capdesfo
#' @title Capulhos de Algod\enc{ã}{a}o em Fun\enc{çã}{ca}o de Desfolha Artificial
#' @description Experimento conduzido sob delineamento interamente
#'     casualizado com 5 repetições em casa de vegetação com plantas de
#'     algodão \emph{Gossypium hirsutum} submetidas à diferentes níveis
#'     de desfolha artificial de remoção foliar, em combinação com o
#'     estágio fenológico no qual a desfolha foi aplicada. A unidade
#'     experimental foi um vaso com duas plantas onde avaliou-se o
#'     número de capulhos produzidos ao final da ciclo cultura.
#' @format Um code{data.frame} com 125 observações e 4 variáveis
#'
#' \describe{
#'
#' \item{\code{est}}{Um fator categórico com 5 níveis que representa o
#'     estágio fenológico da planto durante a aplicação da desfolha.}
#'
#' \item{\code{des}}{Um fator numérico com 5 níveis que representa o
#'     nível de desfolha artificial (percentual da área da folha}
#'     removida com tesoura) aplicada a todas as folhas na planta.
#'
#' \item{\code{rept}}{Inteiro que representa cada unidade experimental.}
#'
#' \item{\code{ncap}}{Inteiro que representa o número de capulhos de
#'     algodão produzidos ao final da ciclo cultura.}
#' }
#'
#' @references Silva, A. M., Degrande, P. E., Suekane, R., Fernandes,
#'     M. G., & Zeviani, W. M. (2012). Impacto de diferentes níveis de
#'     desfolha artificial nos estádios fenológicos do
#'     algodoeiro. Revista de Ciências Agrárias, 35(1), 163–172.
#'
#' Zeviani, W. M., Ribeiro, P. J., Bonat, W. H., Shimakura, S. E., &
#'     Muniz, J. A. (2014). The Gamma-count distribution in the analysis
#'     of experimental underdispersed data. Journal of Applied
#'     Statistics, 41(12),
#'     1–11. \url{http://doi.org/10.1080/02664763.2014.922168}
#'
#' @examples
#' data(capdesfo)
#' str(capdesfo)
#'
#' library(lattice)
#'
#' xyplot(ncap ~ des | est,
#'        data = capdesfo,
#'        layout = c(NA, 2),
#'        type = c("p", "smooth"),
#'        xlab = "Níveis de desfolha artificial",
#'        ylab = "Número de capulhos produzidos",
#'        xlim = extendrange(c(0:1), f = 0.15),
#'        jitter.x = TRUE,
#'        grid = TRUE)
#'
#' # Média e variância amostral para cada unidade experimental
#' (mv <- aggregate(ncap ~ est + des, data = capdesfo,
#'                 FUN = function(x) c(mean = mean(x), var = var(x))))
#' xlim <- ylim <- extendrange(c(mv$ncap), f = 0.05)
#'
#' # Evidência de subdispersão
#' xyplot(ncap[, "var"] ~ ncap[, "mean"],
#'        data = mv,
#'        xlim = xlim,
#'        ylim = ylim,
#'        ylab = "Variância Amostral",
#'        xlab = "Média Amostral",
#'        panel = function(x, y) {
#'            panel.xyplot(x, y, type = c("p", "r"), grid = TRUE)
#'            panel.abline(a = 0, b = 1, lty = 2)
#'        })
NULL
