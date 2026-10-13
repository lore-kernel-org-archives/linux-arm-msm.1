Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC1DD4D9F62
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885522; cv=none; b=jgyWyGuoafvq0cEYhELUMQssYU5UV/ndhkGL5T9YXxFInBvtfpVCtGTTKZ80e40DNX2/21EJK1YyGbg8r7+SxCzWxDqxQeUlaecA/D41hDhNextrbakcZ1HmknV/qkekiplA0q202M3u7Gv0SJleoOE4iYAXjRIPeJIrJrv7lb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885522; c=relaxed/simple;
	bh=FAikOuYHitZp6ddVzGLa/+G6KPECbwnoEeE+84cT8FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WvB7YaP/aCGt59XXuqRxRSEygJPwZgjh9/Jijxmg8cHFjHcCQwsn0H+p8gPaD6+N0FpkHmFgVpRM/Cj/iRC7tOhuIQ2BGfK/QBVG7NTvHePrgmnEfPc7KNKzDTteBP0dH9znFEC/pPSCKSg6pCqsGA0KFI1QKoAlOkz3G+4AAV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fwWoJpbE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AfDiLCuB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fwWoJpbE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AfDiLCuB"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6CRIT949370
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=; b=fwWoJpbELLjhH+E5
	rVLT8bKRY3TvoLrTgh1SXBAUlnJXNC2FOb4UHkdNuiF6M85CkbNix/v99ywW68m7
	v7PtmH7nQV9xVukglJerRqbsTJpZCYspAdlRecn49uqlgp9p7mJ07hyyHGLQlKv+
	T7Nclhyf4fOdZJLvbhowSs3vwis394fFVY5/Z31b/YjnWHv+Db9kHoqll7hpXO8p
	4jV/51PqnJ9MCDSFtRXOPcUSOPw529U5apc7TLJqgSBw8CfMl1i5TmYk26JhCkk5
	ioqmJQL20nqEqQl7EWEZRTgdFKRrZA9ZKvc3b1caK+biLvcSmiX3roITbxZY2jjr
	HQOn5A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9f628x9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 09:58:39 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93dd3c3badbso621801685a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 13 Oct 2026 02:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791885519; x=1792490319; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=;
        b=AfDiLCuBqEJNsKpWruXhAJvqk5fVcz9phNI8FI1jL/q4SCg7N8e0WbpzEyWveKX3bW
         ksX6DkT/kTGSAly8vghZcU1C6Cmildc2Zid/yyWSR3LudRZ9jolzaWr/8r0rD9RCfFT2
         2kecPXbZp0WBBMLQjNebxkdnYdPTE23x9fU0EJraUkhTbYrYS3Kspj22s3Hu6QHwAOCq
         8KF/ZZ2i5M2CIM+HHboNLiK3X9I1c6/c9Byi47crtXtT+g3EuHgFCr+WNBcKtk1GEqpo
         houQ4/tYkCQUW7VWDDWZvX6xv9rEjEs87DhIgQLJI5E3v6t286nUGeocZy18JSyVun+G
         +UUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791885519; x=1792490319;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7l5zIcx1UL+ezYmtByDdHSMtk7pozUTglABDARGqPqI=;
        b=GxWKKLE5oRoSEdMQ6TM3jJaF4w4HXbV97mCSOd1XJiZHwPSfKlcnndf5W5LMlBF81j
         1xWdrQdhFIub0fIPWVW5mciD/99h1HwqkyAs0bnnvgLHWeW46dlT4kov5JH29QwGqCGL
         XqJeB706/4sa60VNaLF9Vu3nACqIwIuusq5Kc6dHrcsZ5GczSZGxZrxXdXsDb7sm53Bg
         Z6mS0W52YIxV6AKonwCKQKxRu7UCw/mZymZS8eTwN9o3pxZLNWugLlMotcjg58Bm9MsH
         GKW+9sAgTycN3pd+/+Brb/zIABSxDtggRS/9Ju2+1BLYpVB52GNolm6h+p1d/K3n104g
         GH2g==
X-Forwarded-Encrypted: i=1; AKwUvBytvc3IEiOMF0doUfQfEB6tHWfeWVAVaRAQG7+4PlfexyNgIDdAjc/0zHNVsdJNiz04dNoQrJmgofKZkmRe@vger.kernel.org
X-Gm-Message-State: AFq9FYIDcFcs9KLNxBAMXo17RikP31S8vFU7LbfBZbji5A9+2KmMbCWz
	GRn+f+gVRoJhIv1coCavvmHjnot2rSj6z008CZmDHfqGegxorg2zB1Vnp5sruBG0k9n+HaMxVCz
	ecrZEF4GrkdTfqTO+PsYC2lr5o1nrmxfmEegdg33kLtZo3OaEhEDGF5+xQsjMUxRvbkHu
X-Gm-Gg: AYBFou2Guf5f2AEew01SCyU0CLJhlfT+6pDOWd1FCxwdBpTqZhUGd2aK+atJYfBMnLL
	+ho69e5lpJ2YZsHWBsqTzFAw7lKRMAfdf9fRsXvjYmcwZySHFl2OrlkT424/yLwW0PfWWdiShR2
	YcTc7sqBl+EO9evz5CTB2RGRD9kToyhmfKDCNPmAqBnN+cObCPnMEJQ1gfnp6WsG+sa/so4KLi3
	x7ClO9ayucNA5Sw87C0lHrrtQrITJpbO46aXx/MncaFyrJOFwwK18IoPgee7YcQ6JfCp9HZsSxF
	F4c7ZvuAR4oiW1etzzW1jWNHK3Ciq4A3lChoy2mKSOFVaRVLr7iKd5kVI3ulu65eQL16clnoyOi
	FbELZdppn08fv9ubmrjHLpusehIJj
X-Received: by 2002:a05:620a:a416:20b0:93e:c12c:9b76 with SMTP id af79cd13be357-93ec12c9f3cmr1306894185a.81.1791885518974;
        Tue, 13 Oct 2026 02:58:38 -0700 (PDT)
X-Received: by 2002:a05:620a:a416:20b0:93e:c12c:9b76 with SMTP id af79cd13be357-93ec12c9f3cmr1306892185a.81.1791885518508;
        Tue, 13 Oct 2026 02:58:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bb6beaesm209412025e9.0.2026.10.13.02.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:58:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 11:57:43 +0200
Subject: [PATCH v10 14/14] arm: multi_v7_defconfig: enable the Qualcomm
 Crypto Engine core driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-qce-fix-self-tests-v10-14-57162a38a554@oss.qualcomm.com>
References: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
In-Reply-To: <20261013-qce-fix-self-tests-v10-0-57162a38a554@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1386;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=FAikOuYHitZp6ddVzGLa/+G6KPECbwnoEeE+84cT8FI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqzgCmLFOSLDnOzisgehD4plX6X6ibyG32KeR9V
 0FH01CKIfaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCas4ApgAKCRAFnS7L/zaE
 w3xpD/9OZVnqav4CittjDEhTEYHIZ3M45w0MMZUJ9CX30r57sfLqXPF0U9r+OTdlYsSKku6yDNT
 miL26KRahsmIvZEm9IrTzcD2NyjICa+mWOcPOx4oNH+ygzjM2K6nTLgIHnS4QV+aGRwyLmB5K08
 jiz2B1bLioO9kSxrRkRGhuxrc2h+s3t0mR7pfrP7COm8TceDp8WovkW9tbgC3PaoMzVImntbJq6
 uKR/OuH1gtxv77nf7bXY5fLuD/UVfJheE9uvdK5ffovjs7sbTQg3r0J3cCn4vsdum2RPB5yVw4X
 YqkTQxBeTDr3a1V0I4w6nXto/2R4if1l1rfA65vzx9Y85AEWF8GUMDwE8jD7PbhSaFjyA5HskaJ
 SbYTjdVC4wE57IYSx3gsyukClHmGirYORlSVrWc73ejV3xq3iVN1fkN4++G67GTU5S+MpNcpRaF
 CrF7jGzpcvl/45w2frtrHKEVFLFOLT8usKWiMEzemY4kzaswWMoGtWHuOphpeAB5H2QLjBSL6ZU
 f3a9ysM9MW/BdxM7JbQXd2/zVYC3gCW7s22TbXxIiQdFmlymFtRWAD8h8oAcdZLgsvjl19JgTdN
 SCjeNJHW9vuofcUYuCjg4XjTo7WHWlYQ8AQcKawKR9NNXjh/jrDPUs34eCEcenlrmAw4ov79OcL
 wJ+3X8T/1Fjm8XQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=FOKOVOos c=1 sm=1 tr=0 ts=6ace00cf cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=QftN5WpXeUmWSfsFEiEA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX2jSCJKuhFDNQ
 WlHQ6uUQ1IYDtWvFutJVwEtoc5h+nSqlRmWuCHtV3h5pZ6VuP1yH21VUs9aMFPOdYWYLYmDMhbZ
 ZB1+JBPZ65/mu/DIr+N/V7M7eXHOf+8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDAzOSBTYWx0ZWRfX7l2ITve8oW4r
 7D8UweUt2IE+JxF4eNZbuv6N4naLwbI7WD5/ysXM9XPxlXVs6AcbYADaIeI19ADV9bG3LJ1kyna
 f/8J3DheBpOOucqmG6of/mBHqWizLvwsGE8MHiEZYHomIt9fuGzaFPSHKPMzet5LXMkIC2oO8Xu
 rHkjTDqTdoARRfw5lILThWgzJWFtV0qLYjz13y1eIpXaIrRLWo+pwdI92EbMWt1H2mXlRA7gvEs
 1by4Hg/LlgVkKLpKBx0aKggMzvZClIkUW4eSHWtoHNzzEHI0wG6V2dnoZTpkqTusdFrVHuMNOqa
 LIjTrrDiIO6xPMQfeRYqXPixkBb2yLEQ0uAjL2mxhbKZMOKAyRsoGzEWebrkC7MrA/haP0ol5mh
 JPAs1Gic4VG3LaymwTEkB7DiZ/TsS7Ao6rdTHRV3VOGh2OJfPFzRhLHDQ/iWywCh4zMU3NY6zvA
 ZIbTW5Gk/KsYu82mCCg==
X-Proofpoint-GUID: 1dtYmjQ776qu7VM5Xl_Qy-ED_FO1qpGh
X-Proofpoint-ORIG-GUID: 1dtYmjQ776qu7VM5Xl_Qy-ED_FO1qpGh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0
 spamscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130039

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the multi_v7_defconfig. Disable the
crypto part of the driver by default.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>
Tested-by: Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/configs/multi_v7_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
index 2d6292f8cab39596b540084fbd8b30f4c25cd4ff..7750b11f80312bf6a6f0fb276315f32f8714b4dd 100644
--- a/arch/arm/configs/multi_v7_defconfig
+++ b/arch/arm/configs/multi_v7_defconfig
@@ -1150,6 +1150,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m
 CONFIG_ROCKCHIP_IODOMAIN=y
@@ -1323,7 +1324,6 @@ CONFIG_CRYPTO_DEV_ATMEL_AES=m
 CONFIG_CRYPTO_DEV_ATMEL_TDES=m
 CONFIG_CRYPTO_DEV_ATMEL_SHA=m
 CONFIG_CRYPTO_DEV_MARVELL_CESA=m
-CONFIG_CRYPTO_DEV_QCE=m
 CONFIG_CRYPTO_DEV_ROCKCHIP=m
 CONFIG_CRYPTO_DEV_STM32_HASH=m
 CONFIG_CRYPTO_DEV_STM32_CRYP=m

-- 
2.47.3

