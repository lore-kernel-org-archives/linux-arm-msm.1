Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794492658;
	b=H9EVc5KC+JM1FISaal/xce2oN5fWWzhcOuFDBC245O5EbWpsE7gfqi8ziPrUzRCY9yVc
	 xLpKn4G/Cd67+ckQnnPyPirIlResKvCOPxp+gADreIpWmajESP9Ou5ccEKMObhvtIQj5G
	 hnm+EIJhUFA/rAnVCBlj4nJ3jJiS0YfXzKELtZuOjD3XTYBRspDotBkXcYkKWy0mjs74D
	 dut5DT7Ecek/0TaGHFga2dBtjy4H83pM9UhaOS2JFhQARZU/dZ3rlIHnFBVeUz4OS8wbj
	 VTcW8rkS6U3R4vRIchjmBF04ykKr3b3BJaH+AchUSW/SDN3NzA5Vpb2aC2apntDxZaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794492658;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
	b=P3cSw1sNNL+RNW3gz6rsq5KmYIlczm5DsTYVJhlGEa0XJelyLmxct3jVJxfg6z1mRXFg
	 GQuQmprCteDbyuE8HAneEcJhB+uYF3vTRta3Fwx8EEJ3e8PnjXPuj4YRlf1KgL3CYTp1v
	 k2o3mlTzWNZbZ/cmN+LnnKLqD9aen5fcJ+0f9HGrDXReCHgQtIjoZ2E4H+vi/PLHn6yl9
	 c1Oy/OUYyv9ANNzL/HCeK9cYwNtW5/tnSzr4qxrK0QV40SYIQTQ1UheCTA4xOUKB4Vxml
	 G3nQJTT+zrf6wtuqmCatpDYTAh4Bk7mFdW+2K9UqSsjsMKZGM3v9+w7L455YkDXDoIw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bgaAsR3u;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="dV/S1AUs";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7040D60A2605
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7040D60A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bgaAsR3u;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dV/S1AUs
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9CX8F4092381
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=; b=bgaAsR3uveq5FK+A
	AoA994h54RJAfAESM0C/mGXB/bkwKxtovBnQGAegTxo745VO1rn2Zhzqc8tOfxfn
	Xlon1xTjuv0t2/G12xCkRd/Aa4CnAtJk5JPJGkEu4K3ZU+fMCmWuHvWFdpC1HdVJ
	3yymi6x3LcVchLDDAJoR408idd4ZECadXHtdFN2RXjKQZxsBcydFGNipzn2F06Ay
	c8NKELgHzMn9/piAMZQmBljBQWNxO8IcL8+PBb17Jz96pVWz6botSNSTmVpOWJ4t
	PkWqL5acXVJgXGOFOzp6RF3sixiLnEjWovQMqkzezyISyc+L5Rf4mV9hv6NeMmV6
	cASBJg==
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com [209.85.217.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw0m8k5kj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 14:10:57 +0000 (GMT)
Received: by mail-vs1-f70.google.com with SMTP id ada2fe7eead31-7d57f6ea49bso369095137.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 12 Nov 2026 06:10:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794492657; x=1795097457; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
        b=dV/S1AUslmGL4FPglkiMplTbafpTF562SJ6njcbmvraBR4F7AGmeEySmd3LWifQKTA
         82uyhktydIv3N3NPXl+tIPraDl70yjSeeWYC6Wid+dr2OioDBqD6LyGaGxXLC9ZTBaK8
         Zg4Ni8vorefsYbi/NRVlLR0ArLEJt8EHZGaxjUfK0IUlK5FeiEPs432wgWUv7UU1fYre
         /PyvSb6kFpCDFCsSLZBDLXzwyeLXjH5kBgEcYGO5pawUIvQkcSqraE5UY7DAFDansVUj
         g1IePfBIg1U0+bM3+Ou7t8EEN62qes2A949cZaBxRTXb9DPRcsc3jOFjmrZY9juJuPXe
         BUBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794492657; x=1795097457;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oXGSSXGtbkPXvB7nHrz702paXG7FvJx+QlGDGhbF1l0=;
        b=LK+u4bhrNH7DsmGhgn8ZRDht4D+MZdK+IbxKPIA+Uxo5FItGQHL3kX1xwuCQAEfoB0
         j5Z9zw9Midq2KbEip6MhlbiUfQ/+1SlzgQctcPTft2r32JzRkf6gbYCP0hoRisGTDGwo
         Bl1W3ETUg2NyV/8XzNeHjUoSeCS0zsnj18nypCNvXFZ+mAwu8cS/w3yFDnwa9mpHiWUF
         OHQxymrTK0AZaMqnV7+WLa+mHeAsRRUXImIfWti0UsK2hf4nGXI3WWA4YRJiECrB+byL
         /GtHSrEqhi+EOHZZ/BkLgu0aP9p2XrZiYqy2K63nNEq7ty5LHcQdmNfo2k+q5I4/4fs+
         WiWA==
X-Forwarded-Encrypted: i=1; AL+hErFeyIIQXJmlXdviYURNiX6KdpBYijDXPGTAikw1VQM+sMzPgfGZq+0mhajDNs6Q1v/b7D1+/BzGDF8PoFpV@vger.kernel.org
X-Gm-Message-State: APuU4Z+y9I28jJpZaP/Fj4tUJCZNWNQpSoH0Nakj1OLtrpjcyhcsCrXA
	L1+Y9Pw7FZy4hCfH8RBmad7E5l/As/HC/AcFqcsQ+SsCdQ4G/HhZVYyksErseQML7ZJKZmlk1Pv
	XuYB0spbwE/GqEn9xRCYJs5ZZ0dqawaNHpI4IQdA3uBrGaAOeRALH+IcGGP7ChxUD3n4N
X-Gm-Gg: AYBFou1SdKiz3oAgK4sULUY6cnrec7nV9JIPJski4BoordrFqi+oPiBrz3BsQRaXTv4
	9FUD4+z9dmGv//HnFnlt1buRIdeb2N/PhnlvvXIPE4wS38bQq9k1EtmQuYPrzE3GT9LLOz6K0pm
	/AnltCD85Bgpjhyyx8zxN38UnikW7RtATt2xwNQ7sWq7/RDx6BsGOqXHHK9/RmTfPAuiGWzXqZX
	70j4iBBCI3dsLxC823ocnWGm4pBL/x/O9bzRzMUi4Pbhbwo/Q9DvQoUPeNfUDchwi1FWuI0eqd/
	r/6koFp8K0lbVd5rhaCtEEtElTUzIbZQZdzZTp/2+Jv2XgR1bXFUMVcMc3zKySC1xdN7+Ibk7Fc
	gSIoH/m3DeZfKCyM7HDvuXOo6DjMPeWjCPykKHoslalBsc+Ufa3BULhmF1sMZdjEUOrLPGSgRnW
	YvDh8eXwdIxy9SnajCACrgbHPQKUZVKf644V9h07rOzWqeXxy6OG7LWjAYXALVTak=
X-Received: by 2002:a05:6102:370d:b0:7d2:cc5a:f0bd with SMTP id ada2fe7eead31-7d4fb2e28b4mr2056773137.19.1794492652233;
        Thu, 12 Nov 2026 06:10:52 -0800 (PST)
X-Received: by 2002:a05:6102:370d:b0:7d2:cc5a:f0bd with SMTP id ada2fe7eead31-7d4fb2e28b4mr2056752137.19.1794492651710;
        Thu, 12 Nov 2026 06:10:51 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e271378sm81817775e9.13.2026.11.12.06.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:10:50 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:10:42 +0100
Subject: [PATCH v11 2/4] soc: qcom: add core driver for the Qualcomm Crypto
 Engine
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261112-qce-fix-self-tests-v11-2-b86a65ee7107@oss.qualcomm.com>
References: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
In-Reply-To: <20261112-qce-fix-self-tests-v11-0-b86a65ee7107@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Russell King <linux@armlinux.org.uk>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4989;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DCwoS/LvISiRO16djPQOua92B5KrkSUJ5INr10E+D0Y=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9cjlekHn4adtDthK6Pr87Jj53xre20mrcTQ/l
 5BLTafMcjKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavXI5QAKCRAFnS7L/zaE
 w0inEACoUhLjGJYZi7GYfjLxc1TvdYUHF6eRl6bNiexRnFPqT6JqZ1KNVQOZMlXFof1HS/7Si8h
 Wj6tA0dVrD19EWqYCtHC298iY83qy93sQ/DKAMKPo3q2dZp1+2F6TlVXsL1/oih63tNo3aiQLAd
 TXvkpEBz0X2WPWc7zII6oQY3+SwyYRHL5nefoox99nnJR3Ije4rXm6RBOMmNT8afJr0Vcvt133D
 0uD4vbFFaCfTMrHOcWxp7Zu+iR+jGglAxfmUzzos6LTNqBYqFeOTagj84iTJMjcWBDQu+Hd5x1l
 YPGIgGqDYEWnUsUi05nZi5LrjuOwTEG4LU3tIGXEVNkKe2kqG0AQ4yYGh0t8AQRtqI6popUrBar
 gx87wC28mfapTGWpys+p9tog+VEHLSyStKOE9u1mDO9PzWb1C2ft4aWa0mK5FQUhg79+SQPYXE7
 Chh/sFAe7v2JQ7NzpbTWNJE0kGY0+51Voi6EHA9RDGDSKlkT04PAkhqoid2TEwXYnKS0Uzp/nCA
 nWgESU0DskrkVu4LLDQKwYe3FKJroz0nOWp2iUae76VUi0u0r79dTvuO6z3uVILgPP92DCpB/vq
 saXfP9JjD+7yX3s6fxKQSbk3TKKpMyP55yR5f8OhliOcyDkNYEXeTrQ4+7SOwnv6iy+ip5WN//L
 duzddPjJWHL/g8w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfX58+4Ujq93Kea
 4stKsEk75MWXGKrVtse6Y9aamsduvo3kG3iuKsL6LJhrqE5C575R4TDJRnhppAvSu7+9X9m0YzP
 xXNKqQLO/L+CG2+mtDA0vTBerflBZpQ=
X-Proofpoint-GUID: ZasSUY0DDiY1bSrUsIgFWUUx7KHrS-FU
X-Proofpoint-ORIG-GUID: ZasSUY0DDiY1bSrUsIgFWUUx7KHrS-FU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NiBTYWx0ZWRfXyvTKnCMFo4r5
 W1kTkHkKG8rK32BrYIAJWhYFAIqXsBgtEZ3Ej1X1FDM2hMHk/V5hXE6Rj8Q1oGmpDgJZbiJvobR
 x616Hc4fTO3qfdcUizJWVtUiAHujLl1R1VmiLeo3dAiZk4SdPd+Y5sHehE8HfyQU+VctWPTrvYo
 rmoP3UgbbTxdJPh1ngeyAIJ7hMLWdKr206hvAoGhb0FpjG42+M/MGO0LA01DBHtGQDxN5CiC1dI
 MRACBNZEP1gDIvvtCNwKhPT88cXlzag6LVFxioegqZmuGUwrpF/mp3zpFKBJ4sW4pD12Q/FxZz1
 KImn1gqIz/aCzCHdif1kYKTAOFtZ20Awg9RKpEz4dkjcLKTAczAES+Mc7SESd03udovuXlw1imD
 UuSF4ZguA6kZmCX+hBa91vplTXOai1rJYKr8gRs67WDNhoudTCeScSrQmPL8gQ2sdOqwlNVORhz
 3r8GVmMWZ+XP38E+Odg==
X-Authority-Analysis: v=2.4 cv=Q9dHcI2a c=1 sm=1 tr=0 ts=6af5c8f1 cx=c_pps
 a=N1BjEkVkxJi3uNfLdpvX3g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=MCZKxbAby-unP1KIBZoA:9 a=QEXdDO2ut3YA:10 a=crWF4MFLhNY0qMRaF8an:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 impostorscore=0 adultscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120056

Add the core driver for the Qualcomm crypto engine. Its task is to bind
to the qce DT node, set up runtime PM for interconnect down-scaling and
register the auxiliary device using the crypto offloader driver.

Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/qcom/Kconfig    | 11 ++++++
 drivers/soc/qcom/Makefile   |  1 +
 drivers/soc/qcom/qce-core.c | 92 +++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 104 insertions(+)

diff --git a/drivers/soc/qcom/Kconfig b/drivers/soc/qcom/Kconfig
index 535c8619197b3e889e536da072ab89d3bb729804..67d54d5211ff21bae77cd8408fa47af630060949 100644
--- a/drivers/soc/qcom/Kconfig
+++ b/drivers/soc/qcom/Kconfig
@@ -121,6 +121,17 @@ config QCOM_PMIC_GLINK
 	  Say yes here to support USB-C and battery status on modern Qualcomm
 	  platforms.
 
+config QCOM_CRYPTO_CORE
+	tristate "Qualcomm Crypto Engine core driver"
+	depends on PM
+	select AUXILIARY_BUS
+	help
+	  Core driver for the Qualcomm Crypto Engine. Say yes here to enable
+	  the top-level driver that binds to the devicetree node representing
+	  the QCE, registers the sub-devices implementing actual QCE
+	  functionalities and sets up runtime PM allowing the interconnects to
+	  scale down.
+
 config QCOM_RAMP_CTRL
 	tristate "Qualcomm Ramp Controller driver"
 	help
diff --git a/drivers/soc/qcom/Makefile b/drivers/soc/qcom/Makefile
index bddd6f0a583673047067b1f0be725b8bb5d860de..9ef0f11d015852d1f599769074d761f1140c08e9 100644
--- a/drivers/soc/qcom/Makefile
+++ b/drivers/soc/qcom/Makefile
@@ -15,6 +15,7 @@ obj-$(CONFIG_QCOM_PMIC_GLINK)	+= pmic_glink_altmode.o
 obj-$(CONFIG_QCOM_PMIC_PDCHARGER_ULOG)	+= pmic_pdcharger_ulog.o
 CFLAGS_pmic_pdcharger_ulog.o	:=  -I$(src)
 obj-$(CONFIG_QCOM_QMI_TMD) += qmi_tmd.o
+obj-$(CONFIG_QCOM_CRYPTO_CORE)	+= qce-core.o
 obj-$(CONFIG_QCOM_QMI_HELPERS)	+= qmi_helpers.o
 qmi_helpers-y	+= qmi_encdec.o qmi_interface.o
 obj-$(CONFIG_QCOM_RAMP_CTRL)	+= ramp_controller.o
diff --git a/drivers/soc/qcom/qce-core.c b/drivers/soc/qcom/qce-core.c
new file mode 100644
index 0000000000000000000000000000000000000000..d51a791bb1a3682b7593928cd9857a1c00e60bbe
--- /dev/null
+++ b/drivers/soc/qcom/qce-core.c
@@ -0,0 +1,92 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/device.h>
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/interconnect.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+
+#define QCE_DEFAULT_MEM_BANDWIDTH 393600
+
+static const char *const qce_core_aux_devs[] = { "crypto", NULL };
+
+static int qce_core_probe(struct platform_device *pdev)
+{
+	struct auxiliary_device *auxdev;
+	struct device *dev = &pdev->dev;
+	struct icc_path *mem_path;
+	const char *const *subdev;
+	int ret;
+
+	mem_path = devm_of_icc_get(&pdev->dev, "memory");
+	if (IS_ERR(mem_path))
+		return PTR_ERR(mem_path);
+
+	dev_set_drvdata(dev, mem_path);
+
+	ret = devm_pm_runtime_enable(dev);
+	if (ret)
+		return ret;
+
+	PM_RUNTIME_ACQUIRE(dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
+	for (subdev = qce_core_aux_devs; *subdev; subdev++) {
+		auxdev = __devm_auxiliary_device_create(dev, "qce", *subdev, NULL, 0);
+		if (IS_ERR(auxdev))
+			return PTR_ERR(auxdev);
+	}
+
+	return 0;
+}
+
+static int qce_core_runtime_suspend(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, 0, 0);
+}
+
+static int qce_core_runtime_resume(struct device *dev)
+{
+	struct icc_path *mem_path = dev_get_drvdata(dev);
+
+	return icc_set_bw(mem_path, QCE_DEFAULT_MEM_BANDWIDTH,
+			  QCE_DEFAULT_MEM_BANDWIDTH);
+}
+
+static const struct dev_pm_ops qce_core_pm_ops = {
+	RUNTIME_PM_OPS(qce_core_runtime_suspend, qce_core_runtime_resume, NULL)
+	SYSTEM_SLEEP_PM_OPS(pm_runtime_force_suspend, pm_runtime_force_resume)
+};
+
+static const struct of_device_id qce_core_of_match[] = {
+	{ .compatible = "qcom,crypto-v5.1" },
+	{ .compatible = "qcom,crypto-v5.4" },
+	{ .compatible = "qcom,qce" },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, qce_core_of_match);
+
+static struct platform_driver qce_core_driver = {
+	.probe = qce_core_probe,
+	.driver = {
+		.name = KBUILD_MODNAME,
+		.of_match_table = qce_core_of_match,
+		.pm = pm_ptr(&qce_core_pm_ops),
+	},
+};
+module_platform_driver(qce_core_driver);
+
+MODULE_LICENSE("GPL");
+MODULE_DESCRIPTION("Qualcomm crypto engine core driver");
+MODULE_ALIAS("platform:" KBUILD_MODNAME);
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>");

-- 
2.47.3

