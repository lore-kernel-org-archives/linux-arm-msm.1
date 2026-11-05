Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793877369;
	b=A4fmK/91neGi6bvwO5laFH5pBhs/yLr8HvMn1XWuPuhUhkhVQL7sugQiDEtR+uwFFHYA
	 MIMVP38O7hHLuGayGhWYqEuLn9sdxxIJ0oNFGmvaOq00SrxP9iX2dU5hw3dtS3s2bhsTT
	 lEux0IQO7hOjtDIvE9IVNpVYB7GE7OW0hwNycFQQ5xGmLtmyHkxY85xKbkfhlT/8N0cc3
	 K5CoGrPeO/aPAhtBnigJeqaxb1p11IldAumZbsCrTBAStDI2KZ7STAgfhwLJjXifROJbo
	 fYZXDZ9U11HEy9bxkrLkUEEUZDsfi+j6L219ma7Vt4mZLwvwDyJ905WPV0a6tq+9nBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793877369;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
	b=kTBp79+5txVWlncsOckO3Y7i/eTZXtfTwJwq7Ccrq+y/VI+NTqZhyerMvKbYTk9TDLR+
	 Hj+OX35duYxETOaSVGGLY1zA8EDdCgSrTXHuzmaQHUhf/HufsWgdqI3tmb/RHWAo37art
	 PBo+HOIftT0NU1cW+hfLwynuKRlds3EnsvuFaNlut0ublFTLPkOtOtvqLzdy0FneqL9zA
	 rzFzO/wpMWgCx1jK9Q6qMm2Za4NfcrbDPGeqwgJlX6LHiYOtIzOAi4F5SnvrpqwhMIo7a
	 htOTLGVewTwHi8Bij/Ibgcfyhmk6oOiCjcQYmnPp4ur8zUBGbeZcecLSbaEU+1weuqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lR+BddGU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgEGOfsi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09C33606D815
	for <linux-arm-msm@vger.kernel.org>; Thu,  5 Nov 2026 11:16:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09C33606D815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lR+BddGU;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LgEGOfsi
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A59tLeo4084481
	for <linux-arm-msm@vger.kernel.org>; Thu, 5 Nov 2026 11:16:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=; b=lR+BddGUfsubROt+
	nGVAasMFB6qoa8WOF+XapxKijBjG2H4V3l54WtyRAdlAUEG/R2idfqVocnUiYTrA
	ARWOuZwmIFj42qyEXJTC6ThUhZ1NMJBzbYlJogCvLz7XOcnTRafS/d4S+ZYzuRea
	yVpniZdeikSYRYXgi37+t4fLfn7J7pzU5iJ6vXC4TIppppyk9JmixPC4G4HLXNlP
	iUIcvcHX4njHV5xyIfDINe7OOhnL+ykx1N51j5oCnC1xeLofoRNku3yP0fZxZFf1
	A4xF1oYBsdSku3i3CpXVUwrn1W3Tl6fcKpyve5LdyhEDXOG0T8a9J42BoAy+hM7B
	7opICg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hrqhkraee-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 11:16:08 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36cec75d8caso702208eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 05 Nov 2026 03:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793877368; x=1794482168; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=LgEGOfsigdMaCzGRg8ybSat+ZLb6GCDRH2lLF8nEZzasd01e8nMdBEiYpgRAujhreq
         3dNQhmISDyY9oL2WLYoFWLQ34s+j/pnSC87HKCbjm0gQSD8XaS3ms0cDQ1ntK+Hyppoz
         JQ+KWUkHHs38iJnIz0mRibfD3YDWk/02VQiPonZg/bE/CtjccKOPfxZ+ovSsy974ddSy
         yTg02EEsgPC0gjpp0WdULokPkJWyvMUC/uY4N4DMUdri+8w/R1mJQdL0HSrOc3wGLSlv
         gSmqs5dGE9DO8eiXld0JU9NNj9SjcVlxn+ZxGZMU5ki35KB/L3iDl51CLyNLx60srdbE
         gouA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793877368; x=1794482168;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv2K6+0+MUtgDlrDif2dTZr7/lGThf5F9lPAXQqHnjo=;
        b=rkzoA2OY5rDw4KkFaas/NfveG4MeuX4qmI9AGzRIqvA7thuCXIXqdjKQ5a0fYjvDty
         w7XyhqToDU3M8v4oKGX1WJiN1cnOUo5VzX5hvuY9LCaV2uqV5uJVJAiIL380qcfjo8MY
         XDIBqLZk0r5/mnISzgKcCJeJNMl9TCzSiefpqsw4dKHLW5xrCtlXe0Qz6T7EQMCJbzZr
         fd8TkagBvTM+vxqMB9oxsL1c8DU1gmwrktoLSj7rn6P58D/7ABk3icksypuTI4KgQwoN
         Dnr7mpgTLvW8K5EmC51tx4r+EH8/9S/ol17qXRLTbs2SdaHsOLwkM3ynJhSCWgzi4UU4
         7laQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3BAh61w9Zfj0by2GkKyUBINBDTw/0fc35cXHeuRcqSGtt3vue/5Ge0A4pcpJCbXKxSO55Sgk+D0gmN0wY@vger.kernel.org
X-Gm-Message-State: APuU4Z/MiCajuCbwn10wqq5Ce1KwWYWiKx+8aZ9YUhexQl8PH32MWx8Q
	YkU+6xgJPrfP5rnd+Ne1DqKZyECuB24QnJFGtZ4Ep3YY9S11Y5F9szlAakkFg6F9nCtYLGT/yV8
	Nx7bU7Xlv1wkrW36TNy1pO8AnUJfCb6KBrB5rvJ1KLQcKjcqCbDSfvoFzP+2yQwbvbXEa
X-Gm-Gg: AYBFou0TrB8ZVEupWOylSOyW7VKHZsr1N9WYgQYK3UHRt0GktUro3BMn7Bxmr2wsulP
	Q9G5SSvCvgLF5sq5dG0L13l9FlBi8qmlGFIIdjpIHdpgt0PXSp0ufN0eHSIs7dJvn3w8DoVG7xQ
	BjM3qrmBxYFCEGqUTdM4TR9+qmomttwU2NHZXyPS7JZTil6ZoHlTvpStKinD57bg1PnhD078JD6
	yyWEjTC49i1wOTUAbJdmLyMJuLqHbVDMao2Huw3qeMniLIGCFDz+8KbqKFF8L9T1A38Hl8OToIu
	uS7she7KeOGtwaUy5vvIHPJFWPOjvTKZangb49PQBIksrJ9rhBw6WEMfVTcgYnODWI4Ln3k8Tjx
	rLKqssUu/3Ld0YQd1cRVvFdEXRbXC1oi1D9cbCMINIXDqsEL/gEHFHHsT7F7KTc+x84G59fI1uA
	==
X-Received: by 2002:a05:693c:3881:b0:36e:ca05:8c3c with SMTP id 5a478bee46e88-36eca058eeamr629100eec.2.1793877367572;
        Thu, 05 Nov 2026 03:16:07 -0800 (PST)
X-Received: by 2002:a05:693c:3881:b0:36e:ca05:8c3c with SMTP id 5a478bee46e88-36eca058eeamr629067eec.2.1793877366941;
        Thu, 05 Nov 2026 03:16:06 -0800 (PST)
Received: from hu-hdev-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36dd7ec8881sm14002125eec.18.2026.11.05.03.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 03:16:06 -0800 (PST)
From: Harshal Dev <harshal.dev@oss.qualcomm.com>
Date: Thu, 05 Nov 2026 16:44:55 +0530
Subject: [PATCH v6 7/7] arm64: defconfig: Enable UefiSecApp TEE client
 driver for Qualcomm SoCs
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
Message-Id: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-7-c7d68ce05c51@oss.qualcomm.com>
References: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
In-Reply-To: <20261105-qcom_uefisecapp_migrate_qcomtee-v6-0-c7d68ce05c51@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@oss.qualcomm.com>,
        Sumit Garg <sumit.garg@kernel.org>,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Basant Kumar <basantk@qti.qualcomm.com>,
        Apurupa Pattapu <apurupa@qti.qualcomm.com>,
        Arun Kumar Neelakantam <aneelaka@qti.qualcomm.com>,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793877323; l=1240;
 i=harshal.dev@oss.qualcomm.com; s=20251124; h=from:subject:message-id;
 bh=qDDal9GJ8g6Ikut3T7wcy/AIpZjwo/GMmoItp1TdU54=;
 b=Ro59s+sMdEnPuTJjz1hVTNxB0xO/hgmSpPmDiIqtiTBstH6De1YfYGFDwOx1GP11ZH9UQkkoS
 ClnOQO4R5RbCEWPsVLFgl8eFwqUW/QqNuvbQngOJpsGou+L69pmFyfj
X-Developer-Key: i=harshal.dev@oss.qualcomm.com; a=ed25519;
 pk=SHJ8K4SglF5t7KmfMKXl6Mby40WczSeLs4Qus7yFO7c=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX0QlNz6KIYBEw
 Px+sasEwS7bEr/12U88ZwmFQ3sFeevU732KWYcgMg455r6M484jlP/dB/6e0PLZ6GiMn4YTlGcc
 Vg2NkAEFW9R5H/AjFAHshpyI9LVsmVtKOvEqHFW00/fQIxoVTtkkXgWoapANRed8NZBjrrrRPEV
 3ZI+NgA1zjZkU2nkYjx4hPaEB7LqyxNBklKlNvYa8Rj4/4pB+qhjJCbXSdrHOgu1rQeZPkjDIns
 BvFEqYEkDXLdrK5fPVg3YhUcNB0xqmPGLfaPhQOPl3MjgipPoaO8B0JYkmJRe+qzwAGHYJsCnbf
 Fl4eMZQmHggrrBX0C3VnP879lPhlhvll8e9if7FFjYj/tZso5+XnKRm6fwhPdhGtPtiqxAQSve7
 FdehmS90jzX7bWfg2bnE2U+ITRWWFXNj6bxsliBVkAitnrOqeRLIT1u4IA3LuYM64wDQ5uYSUhG
 aSSsiA7wuVC1F4SDm5g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA1MDA0NCBTYWx0ZWRfX0g1LTKcFvIIX
 TCqCHykhP4kuwcZE4ddqKxZzfiw0eCEebJHhHT5tvzDo3cnlfvgKfwH+tNCg7a87GnEX4cJUwjt
 xhnbaI/jzpDFAz+UgteSMZ0ys+35xmE=
X-Proofpoint-ORIG-GUID: dN1MO-MzXzkrP5excABHaVqTFqvH5MA0
X-Authority-Analysis: v=2.4 cv=a4+lZkSF c=1 sm=1 tr=0 ts=6aec6578 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=L1DwG8FsHRaiiIOMTvUA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: dN1MO-MzXzkrP5excABHaVqTFqvH5MA0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-05_03,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611050044

All Qualcomm SoCs starting from SM8x50 provide access to the Qualcomm
Trusted Execution Environment (QTEE) through the SMCInvoke interface
implemented by the QCOM-TEE driver. QTEE runs in the Secure World domain
on ARM64 CPUs and exposes secure services to Linux running in the Normal
World domain.

This change enables the UefiSecApp TEE client driver as a module to provide
access to UEFI variables on Qualcomm SoCs via the uefisecapp Trusted
Application running in QTEE. The TEE client driver communicates with QTEE
via the QCOM-TEE driver.

Access to UEFI variables has been tested on a Qualcomm RB3Gen2 board via
the efivar tool.

Signed-off-by: Harshal Dev <harshal.dev@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index fce418fe6ff6..a8525878c679 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -277,6 +277,7 @@ CONFIG_IMX_SCU=y
 CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE=y
 CONFIG_QCOM_QSEECOM=y
 CONFIG_QCOM_QSEECOM_UEFISECAPP=y
+CONFIG_QCOM_TEE_UEFISECAPP=m
 CONFIG_EXYNOS_ACPM_PROTOCOL=m
 CONFIG_TEGRA_BPMP=y
 CONFIG_ZYNQMP_FIRMWARE_DEBUG=y

-- 
2.34.1

