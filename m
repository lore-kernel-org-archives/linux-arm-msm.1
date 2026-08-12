Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252AB44780B;
	Wed, 12 Aug 2026 13:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786542686; cv=none; b=F5WIfaFUW/xzfZpffT+SCE6SHyNJ0NwAikJZKS3ya/bdgv6XuyGEtW9NJIWn8nmlwuWCNZLsN0FdH9RAchnhu1AZjvfXYPZJlNJneiZ/ewR+bEmv1KP8/TymJYoP5ThjBl/neO7Wh8KucSKysPCjxGYEteJH2uNxEJYePrPfarY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786542686; c=relaxed/simple;
	bh=3RpsrGrEpaXVzMDnEzu/k/+zJ+gq0zR7Mm2tcrrqxx8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adziuPurzhgwS4JshdY/99jf8HbcCqXNcaXQHKLAWpjmOwf62YwYAq8ue+zAYNIRBWdEN/i7Y9Q8nDEkWnf1OIqBIsRvObxPgH2p1y5sD1tK5ryUVrVeP1TCClGRZKe4FueWJwd1uvcvnRPV9QmWDN5ju2RieXHYnKNFNNmrAYs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GCrHKIGX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GCrHKIGX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21C981F000E9;
	Wed, 12 Aug 2026 13:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786542685;
	bh=HfSrybHosmPBbBh3i1Ck4hweWJGnDH2ZnIJOU2XsUCw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GCrHKIGXSnClTN2uQy+fhLraalO+fZvDWq/gX7azMB8Qh49SRNjK0KVASfCz/zRh+
	 zs2gj5M+d0C/aj9vZ3bRxwf2Eq837L6SlfHEYuKFMLwtrWmsH9T0CoOKVEJJKbps0Y
	 QQvTwLSt/H5TeCm9RwSm1cuBffJ4lns/W3daUDxQWr7SwJs79DmsdfeMRaaRXmaqG+
	 nDAKZi9JUm3KTmNpYy8Ilo+bpMJbDVXDk2I2x6UWIhuRotIFnTPbkxj3J0b3hskTmb
	 /RAY16QrWLxEGXJk4I15dC7j342SvWg94LFVQhbknGiaxL95L9sCebjZhCpA4HQrli
	 yM1K40l8wofQg==
Date: Wed, 12 Aug 2026 15:51:16 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>, 
	Marijn Suijten <marijn.suijten@somainline.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v9 2/5] phy: qualcomm: hdmi-28lpm: provide dynamic
 configuration
Message-ID: <qxuzipnza3tzoig7xp3653vcqwgubf6zerzbgdmx5h6acof7zm@quy7xzjml7kn>
References: <20260513-fd-hdmi-phy-v9-0-ca98c72f1f9f@oss.qualcomm.com>
 <20260513-fd-hdmi-phy-v9-2-ca98c72f1f9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513-fd-hdmi-phy-v9-2-ca98c72f1f9f@oss.qualcomm.com>

On Wed, May 13, 2026 at 09:14:05PM +0300, Dmitry Baryshkov wrote:
> Replace fixed value configuration tables with the values calculated at
> the runtime. In some cases the values might differ from the original
> values. Those were validated on the IFC6410 board.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

One nit below. With that fixed,

Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

> ---
>  drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c | 325 +++++++++--------------------
>  1 file changed, 104 insertions(+), 221 deletions(-)
> 
> diff --git a/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
> index f1e7113e10bd..90d3331313c0 100644
> --- a/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
> +++ b/drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c
> @@ -148,222 +148,17 @@
>  
>  #define HDMI_8960_COMMON_DIV 5
>  
> -struct pll_rate {
> -	unsigned long rate;
> -	int num_reg;
> -	struct {
> -		u32 val;
> -		u32 reg;
> -	} conf[32];
> -};
> -
> -/* NOTE: keep sorted highest freq to lowest: */
> -static const struct pll_rate freqtbl[] = {
> -	{ 154000000, 14, {
> -		{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x0d, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x4d, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0x5e, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0x42, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -			}
> -	},
> -	/* 1080p60/1080p50 case */
> -	{ 148500000, 27, {
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
> -		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
> -		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
> -		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
> -		{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
> -		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
> -		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
> -		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
> -		{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
> -			}
> -	},
> -	{ 108000000, 13, {
> -		{ 0x08, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x21, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x1c, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x49, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -			}
> -	},
> -	/* 720p60/720p50/1080i60/1080i50/1080p24/1080p30/1080p25 */
> -	{ 74250000, 8, {
> -		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
> -		{ 0x12, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x76, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0xe6, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -			}
> -	},
> -	{ 74176000, 14, {
> -		{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0xe5, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x0c, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0x7d, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0xbc, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -			}
> -	},
> -	{ 65000000, 14, {
> -		{ 0x18, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0xf9, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x8a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x0b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x4b, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0x09, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -			}
> -	},
> -	/* 480p60/480i60 */
> -	{ 27030000, 18, {
> -		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
> -		{ 0x38, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
> -		{ 0x20, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0xff, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x4e, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0xd7, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0x03, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -		{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
> -			}
> -	},
> -	/* 576p50/576i50 */
> -	{ 27000000, 27, {
> -		{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
> -		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
> -		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
> -		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
> -		{ 0x7b, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x01, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
> -		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
> -		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
> -		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
> -		{ 0x2a, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x03, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
> -			}
> -	},
> -	/* 640x480p60 */
> -	{ 25200000, 27, {
> -		{ 0x32, REG_HDMI_8960_PHY_PLL_REFCLK_CFG    },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_CHRG_PUMP_CFG },
> -		{ 0x01, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG0 },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_LOOP_FLT_CFG1 },
> -		{ 0x2c, REG_HDMI_8960_PHY_PLL_IDAC_ADJ_CFG  },
> -		{ 0x06, REG_HDMI_8960_PHY_PLL_I_VI_KVCO_CFG },
> -		{ 0x0a, REG_HDMI_8960_PHY_PLL_PWRDN_B       },
> -		{ 0x77, REG_HDMI_8960_PHY_PLL_SDM_CFG0      },
> -		{ 0x4c, REG_HDMI_8960_PHY_PLL_SDM_CFG1      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG2      },
> -		{ 0xc0, REG_HDMI_8960_PHY_PLL_SDM_CFG3      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SDM_CFG4      },
> -		{ 0x9a, REG_HDMI_8960_PHY_PLL_SSC_CFG0      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG1      },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_SSC_CFG2      },
> -		{ 0x20, REG_HDMI_8960_PHY_PLL_SSC_CFG3      },
> -		{ 0x10, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG0  },
> -		{ 0x1a, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG1  },
> -		{ 0x0d, REG_HDMI_8960_PHY_PLL_LOCKDET_CFG2  },
> -		{ 0xf4, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG0   },
> -		{ 0x02, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG1   },
> -		{ 0x3b, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG2   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG3   },
> -		{ 0x86, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG4   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG5   },
> -		{ 0x33, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG6   },
> -		{ 0x00, REG_HDMI_8960_PHY_PLL_VCOCAL_CFG7   },
> -			}
> -	},
> -};
> -
> -static const struct pll_rate *qcom_hdmi_8960_pll_find_rate(unsigned long rate)
> +static inline void write16(u16 val, void __iomem *reg)

No 'inline' keyword in .c files please.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
