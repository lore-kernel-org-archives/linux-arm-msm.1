Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A514747CA74
	for <linux-arm-msm@vger.kernel.org>; Mon,  7 Sep 2026 13:00:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788786048; cv=none; b=J77Lzq559a3iVihyDGMfMLTXZ8+OqN131KoiXx6F3MYtEiuvrrGGjY1pwza9tS8ndE+pN3gpFrnmvamdbxiZ+tvVscx/rDtig0nxjnP/EbK7cxTAtZdGzWmQE/Y8I9Gam8E/dsoZog+6ogikmGQyHEHRA3HzLFnmP1PemKj0d9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788786048; c=relaxed/simple;
	bh=yyFXmjX5xn4LHf0Cfw4ccz4CCqq/j5rE2bpo1iUGClo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dF6G8RC2BGIRdxtxZNlrC0q6HLSrbQO36N0JXzbWWGaymbr+7gDReKzVhWhu6Pwoxzr/VinZ+AVkGQfPTRGJmu4LcpJu60Ir7QxiFqHD8t10oKPg+X74Eky15uNP+8MILunYwLe1VKamLBupBMFpl+U83GClzXVZTtA/Kq8WN20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MtLu5hYd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LAGy5AM3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MtLu5hYd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LAGy5AM3"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 687AnR5o217666
	for <linux-arm-msm@vger.kernel.org>; Mon, 7 Sep 2026 13:00:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vnsP6hjeAwNYcPMBk8GfKispcvJsO1pbP/Kx9Lnz6c4=; b=MtLu5hYdHHBHD+Yc
	/wh4ApHi4GUAzU93qQZULgTnpk9hXgd1DZyqn0mqhJm+sQYmZKdSCAfJQklQBDKs
	Myuh+dH5Oz9LEipTM6rBykD+UsQtibUrvuPcdyguabknHBGifHG1ysEr/nezcvdT
	CgZ5lCIS4fPyi+g/fklNX8eOfLdl5DufSLk64ps4SG8hdg5MPbwM6VVZYsa56IXs
	KrhdGzaXMjJi1I3GV4vKhiJjWVUgGz07rKXdRbH9ttIPSfUNO7FPrK2OQOCXTGWv
	J2UVljv91S5iybpSz0IegQdwPEqqqrupQc6I4XPIg/L3GdeVfLi0PHehi2agOiDa
	dlJCFQ==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ghtdqgvw2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 13:00:34 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-97e99aaaa6fso174799241.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 07 Sep 2026 06:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788786034; x=1789390834; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnsP6hjeAwNYcPMBk8GfKispcvJsO1pbP/Kx9Lnz6c4=;
        b=LAGy5AM3Me+5p+s4sqtaWlXqxujgKeNmr9DyCOCyVicrxWYrkMi/1mVEZGwGdIUwSz
         yYSySHg+/eFLcvPJJfoCHqGXoxlIFgPH3VAdajy6TfcPgIa9OWvJFiP60FjCJj6LBgF7
         9VaP2VNSXCJo/czP3O7ExQyO/aokn43pniIa6S8bOZjaWJRGa3WzS7urGhZSRR/LoDGO
         q+zu7+Imjqbv1Fljf/lsqMYikVunyQn3AQfp+sUxqqDydLDTvij+GTxkt4j/RlgDI86s
         I18bGLn5E+iuHzzqY8kG3r0SXGEbz8mIw0pfrz/rwFDTt9YS2944r+5lG3yziKNCO1bo
         z2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788786034; x=1789390834;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vnsP6hjeAwNYcPMBk8GfKispcvJsO1pbP/Kx9Lnz6c4=;
        b=R+ABVP91kxmqcCnYDTM+3XlUWmK65YO9IjNMfsr8N9wLEdXZ1cWTgMqRXuhsWhwIfA
         qrRsl4210zGfeya3Fg9DVlpXYJwWscP7Qo0Hu/YenAVijP23szpzbFdqjXWGL1DYfohd
         z/fZKeu42/6BrVtfr1yOdB6XtmzD0C+A6DRYsMoisgXBHg/mkvZukphceN28Zs1NL/TV
         jjxW2RV6RRdAUZEwXoAx9CyEeBhpigRoUKBEe/mCwQ41IHk2jyD6bEf+E6H4kTKA2asp
         vIlfMrRzJ24F9UPzNgAmNhDnxZ09HnC/Nmeay2YdmWSMk1HgO3q3jgesU6kXWxahgaou
         xckw==
X-Gm-Message-State: AFuF++nEMXMXMKN4XLmvFqs/EnIxt0Mu22/B2hYd7K8BNU7HMuxYbsLa
	l7T85EwRY2klzylrrL4neKnN2wK07EkN44avT68/cHrwwPBN2csRE1lmnlUlmr0FuHr2fg6RcE9
	VFCZxcvS0GqmU1b6a7MJqBqDk0JEbhIh5CJ/kRsbotW1bV4vI3hSII8Vol8h/E5kD66HQ
X-Gm-Gg: AYBFou1hnH2jMJXz9VdiauW+rmmPA1K4BDvwsHPkVkcO0ag6XLlC3mfF1GwfCQMjvC6
	qcLG0zJbe4s8LLjv/3KefTTSTk5VjtjrdiI/mugr9v2XAJRztsw+e/Xm+fUTaPxaq9BVVXSzXEv
	qC7SLBYIj8WC4DL7PWBN/OxEI632Zd0WET0CRErUzcmJSxXMAT4TV4DhQ30AE1E2vaTk+JpUeph
	SBfBmujJ2C4iXkUZDRzr7MUsiW3U1iCGLdu476OEzmEq2nZ1qcltx0ubpHvXSq7MUgrclRLOLjN
	EkOJ3Bh5ZT9/S8QPXvZVCmKE4EfBYxNcpAjTHnTTwXMh5ZU4IasiA4ILLQQ7q7MdYbrlbdbGue9
	CtxcXzjtQ3Y7uaimARlwOYwo=
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr6602120137.0.1788786033561;
        Mon, 07 Sep 2026 06:00:33 -0700 (PDT)
X-Received: by 2002:a05:6102:292b:b0:782:e19d:6f39 with SMTP id ada2fe7eead31-78a4a483c93mr6602074137.0.1788786032993;
        Mon, 07 Sep 2026 06:00:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cff81c9b5sm198751205e9.4.2026.09.07.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 06:00:30 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 07 Sep 2026 15:00:15 +0200
Subject: [PATCH v2 1/7] drm/msm/hdmi_phy: Cleanup after
 msm_hdmi_phy_resource_enable() failure
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-1-b097cf1eac77@oss.qualcomm.com>
References: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
In-Reply-To: <20260907-drm-msm-hdmi-fixes-before-eliza-v2-0-b097cf1eac77@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Archit Taneja <architt@codeaurora.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, stable@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1532;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yyFXmjX5xn4LHf0Cfw4ccz4CCqq/j5rE2bpo1iUGClo=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqnrVklronCnP9I21nHkLe4UhlAuAhPrNlcB+Ld
 wfUHRDx96iJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCap61ZAAKCRDBN2bmhouD
 1z8CEACWoKnaQY4soxW93YzD/YdKVaoCi4vf+eBJPUfeyh7K82OTTkysJ8cMtu/TQ+2HDBY/LNa
 DS1U3plaMTfKY1pTYWAEoE/3RS2mdncjoMDqXX6Qrcwwhv1KP6uOdn2ZO3qtrs8GxFiku4Lj4u5
 i3HY61pkGWkQLEQBhSGGcZbEALxnfchvx962Zz506VqDHTo7OxzS/DrG5icMcKFYgkPPLpUVbs9
 thZ8aRUKGXq+Kb0ER8sGiORDA6dcw3XL7MGcGwUDBDst/UNx1AEzeKfDaWTi6Vq02jFMSC2b9cz
 QD+Q81zprx3jlALkNZ60CGDWViwpZanrdZx8H2dUOUL6h2ymrSF9QFCoG7ycbro+ux+JE/Nn08Z
 tcbIofFFJauZcRazikXJBWdTfn6UOoFO4NMp3Swd+uQxscSvbfG45+WzCUSrAA2CyNNOJn/fXeF
 H44NRdjsqMnqUaPvX9tcmkO1A163kbbMK1yNfhp5NRk86ab1IXvH44dvGTMXbki4EAM8kzH2rpO
 tRjzW2p3M1TXIo3eUmjgY2BuYT0lRkUr/8j47MN7N0t8HBxXTPpX/YSxdYti8VUpBGLPw/gieOh
 D4VEdeMwkl5PCk2aJuo0baVABpwFFdemjhOtpVMJc5yoohP5nmP8rNIZxJoN7nXVTN0+WQcIBfe
 XpFkgulvgPJrpHQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX3XyACiqOIxq1
 zMhWH/4ZrbceKFsB70Ct5N8TShJfKcWbLj6qD7LCHtpich1Mkk2lo3wMohBs+2J+wVy1yiv43fm
 kcKYrPNgzNJ9OF5M4N2fax2V18qJ270FktysE9M7yEjTIlAVs2Q2cFi7/L9QzZ1yYUwBdDsz6/r
 zsfoi9QF2VwVAzq/t8KYdDyvf/1VFv6zH8PGdQ34XrFwFXtLIWD6KAu7V4mBFJbD5LKHuGa120H
 EeHm2xnmei2iR7d2ALJ1jcTeUh7cZNTCEx9dyPqTYu9ZVuTBrBoSsR3YyoV2TAtfSu9gQ1R3BNv
 xl1EWjdulTB9CAW8/dHlIbbix6EGgcJE9fwTNeIkwYWvEmbMZdA08kgmIUmNRImmiq5EmlvxRH/
 s1N+zJq51LRuvyKKPvkObOmVWnwehsur09H4ux8Yg+w60D208KCa5u03dHAx3O/siFvwh+HrsX1
 Vfo4SyYVUUsg4p3uYsw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDE0MyBTYWx0ZWRfX7qr/efOyNfZi
 hj7HHMuhB89obsfvhGHzMY44sTjh5yjtqUZUhCu2fGcRYwZrmWhIxq3LsClsKhp6cDd3NEtlMBt
 aJbEVm9bBe4GAFf9Zis5QdqsXMNeUtw=
X-Proofpoint-ORIG-GUID: TczPNsxeoyjqRbXKIkNZybt_36oW27IO
X-Authority-Analysis: v=2.4 cv=U6aiy+ru c=1 sm=1 tr=0 ts=6a9eb572 cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fGoX3SELrpdlimCKowgA:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-GUID: TczPNsxeoyjqRbXKIkNZybt_36oW27IO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_03,2026-09-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 priorityscore=1501 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070143

If msm_hdmi_phy_resource_enable() fails, e.g. when enabling regulators,
it should reverse the state of things already changed.
msm_hdmi_phy_resource_enable() is used also in probe path, thus such
failure, which could be simple deferred probe, would leave these
resources permanently enabled for the rest of the runtime.

Cc: <stable@vger.kernel.org>
Fixes: 15b4a4523859 ("drm/msm/hdmi: Create a separate HDMI PHY driver")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
index eb1088755cb3..fd675f537f2b 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_phy.c
@@ -67,16 +67,26 @@ int msm_hdmi_phy_resource_enable(struct hdmi_phy *phy)
 	ret = regulator_bulk_enable(cfg->num_regs, phy->regs);
 	if (ret) {
 		DRM_DEV_ERROR(dev, "failed to enable regulators: (%d)\n", ret);
-		return ret;
+		goto err_pm_put;
 	}
 
 	for (i = 0; i < cfg->num_clks; i++) {
 		ret = clk_prepare_enable(phy->clks[i]);
-		if (ret)
+		if (ret) {
 			DRM_DEV_ERROR(dev, "failed to enable clock: %s (%d)\n",
 				cfg->clk_names[i], ret);
+			goto err_clk_unprepare;
+		}
 	}
 
+	return 0;
+
+err_clk_unprepare:
+	for (; i > 0; i--)
+		clk_disable_unprepare(phy->clks[i - 1]);
+err_pm_put:
+	pm_runtime_put_sync(dev);
+
 	return ret;
 }
 

-- 
2.53.0

