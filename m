Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33939329E44
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 09:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784367102; cv=none; b=DyZFEQLvosjg80XjAQQ+ETCMWopL9pm2YuUHWsiSCsJfb0n1AIPBp+w4YRqaxTBR7D3woePN1mLdagln4jPFc55YDN1wIL7lCsNpeb9KG88ANqTyU6c+oYdS08Ft0lbdWwpKUN77flXdrUFankFDaRg337IrrvnHYkMVLsgY25E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784367102; c=relaxed/simple;
	bh=wRFmdP5HalCmUuDS2g0fTkGfPOcFATvyJ5CXT1YJN2Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=MF0l9zKnxRO1A3afx0KnDobmvCYYnaK0YJUlEtA49/4KsqIkwWKWRPbq23yt40tVhn9oolC0TfVNWHAUTZ15kh4eywQIkzSdWSiSSNbfyfTaxZUmiTQr28QEEHdH/MAvUgdskjad1Oq51VQ2lT025WuGveFyUEVE7rZqzF5IO0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DheT2es1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E9IIy1dZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DheT2es1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E9IIy1dZ"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66I6QiHn4192174
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 09:31:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=irDEqwNAa7xuitX6XJnBw4
	IVGcq9DbcuVTAX1DMOuxw=; b=DheT2es1ue/MVx5lE9keJaeDBhNZ1a3H3hQhlc
	pxJdZ/HCn3FXSIGWHintX9IrAa8DD41u0wLUYUePx+wmiDwmBitiohKayQVzGEAG
	taWyjjqdeJbNffbOoPk3ehj8581rCtukNwfkZdTEyTstkCy5usMWoTn3M/ruYwxY
	bQ6wJUvQ3Dj2j9mWrf03nKUXbewXlMKCuhzJAHFKfGmOZ5TtuDzLT5jf6eQSyxJA
	YnvAaIXMqrRVjgs7j4ux2l+Qj1T/gj3h5gjnlrDTYgvrK+G2dmJP3J8M2/UkSsT7
	twXCNv4IEBZYzSzr0y201St5ytp6/gwukmIcq4qjUrx4601Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2bngg1x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 09:31:40 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-c88ab059052so2730307a12.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 02:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784367099; x=1784971899; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=irDEqwNAa7xuitX6XJnBw4IVGcq9DbcuVTAX1DMOuxw=;
        b=E9IIy1dZvy+IBXyisz0gECAL2xPNq5/i9AHGGyJUM8S20o3+Ec0jUO0KbxrfABzdJC
         IU2RbGS0THVdER4KgJ6+rj1k8yXo34XBGY67p16RxjAMMmOguuxSFEqDjOyV9qc7K6uX
         dWkWDyxmdgVvD2iuAK9ZEoJidg+d2pYcd1GKb0x57Wa/25Nyvf/SVv9Lk89Se12n7N79
         zxovDC1ThIJeh1lM/cxYoMpjo2RPxuZjzT/Cx1myK7VGWb73w1D2iTz0Dy34Lhs8FPlD
         usxNXBfpC3VftnhVlwk6mwrZP1gmpx+9ts32lpE1++MBW8EAkztQ4tpMIzM2FdHSiyfI
         GrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784367099; x=1784971899;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=irDEqwNAa7xuitX6XJnBw4IVGcq9DbcuVTAX1DMOuxw=;
        b=oc/Nv0FbD63WfGzzi1s2s0GFf8R04FPMvjIN+GJNUopEQDdSmsANn0fAqpzSDrEHcv
         J8B9hhGFB4nDDxs5jSHUTXB1CRUmNlMCQlXI89ypS7FdAIDNPi8BrTeKuOg/gtgKKXvr
         Xpxykc1YeblSElhY1SEL2DwoYLXdTPusJO0G54Ny/taFXaAmEt1XbGeD1PCmzB6vrREs
         32D2TyZpXscLENLDQr1/xwUDCQlenOb4bdSmypfeYmWYl/ZL8/Wj1TMbR39Ug2p+e00O
         I67NZD9i1X7usJSqPZPmL3DKuLJtzUFcrZRokSfE397SVzbhCBssdUtd1KjyUpOMnH41
         nhyQ==
X-Gm-Message-State: AOJu0YyM4iNZVSPES5vZ0T6Z1Nbqa9jMNw7LsB90ZlyxP/4TDWvHkPEE
	V3IpNkHkrjrnnUP2Yg2QpXq/sFRirpD0W7U63cabNt/mlfejuM2nJTbfgnR12ZULqIOS8eXL5+k
	Vbe8h1WA28EX5ubJv9ucyOZAZ1HcIP8r0aB/gUAp6wQJNG1iJV5l5sPoYh6BHsx2p5ZdI
X-Gm-Gg: AfdE7cmUIk3t8ToX3oN+/4BJNBWbpg8mMJH/oKU0DGP73I/hchRXnCeIxWrRuThw53d
	oShVBjBbZyS5fCrTsskbB5sv1bUYjI/acyHBsKpRYBJon3XxM/e7W7urU0iFxrLkOT1UZ1cIU7G
	IfD3XDdDdT6LOhQ0usjGEvCcy/IbDPBuxRYvjoLndMrNb0QrvcxIk/JQAy4y23JTfbyl32ru9Ps
	76wPXL41NsVXs1TNlkmTsgE5E5PlqFsfQI7BpoYjc4GvEzyt+GZY/URmHoaNFhHK83yuDtU+3m0
	bsAfS2t02lbwDaOaHIGTLIQ1kF0i68SugahDC2Z+A4C7JV8wROfcg2JmXvmEyq1FltGlbNdfAEb
	Ha87LUN6SzBzammXOuNBfZl1/7t4UCiZId49rPH2n7ob2MVAan/S5ez6DkmjnZ0iyXW+TPA==
X-Received: by 2002:a17:90b:3907:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38e3d175d1emr12033347a91.6.1784367099522;
        Sat, 18 Jul 2026 02:31:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3907:b0:369:7491:7b24 with SMTP id 98e67ed59e1d1-38e3d175d1emr12033322a91.6.1784367099066;
        Sat, 18 Jul 2026 02:31:39 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2cbb6e8sm11993322c88.9.2026.07.18.02.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 02:31:38 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 15:01:31 +0530
Subject: [PATCH] phy: qcom: m31-eusb2: Fix return value of init call
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-m31-eusb2-fix-v1-1-8588a1b94d76@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPJHW2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDc0ML3VxjQ93U0uIkI920zApdMzOz5DSLZNNEc6NkJaCegqJUoDDYvOh
 YCL+4NCkrNbkEZIhSbS0ANHg0MXEAAAA=
X-Change-ID: 20260718-m31-eusb2-fix-666cf8c5a72c
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784367095; l=1076;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=wRFmdP5HalCmUuDS2g0fTkGfPOcFATvyJ5CXT1YJN2Y=;
 b=zJ4R9oFO72vll4/JFYxNYrqMSQqgqc6xSVXQTgykjcY4nJsZCrMhFPlhs/530wDGOpZCadVr6
 r3QJkh5Tj8NAvULS4cHrpCQxBvmYoFQQ0bGh+PXmvICGCskiS4mcRI2
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDA5NSBTYWx0ZWRfX+CgaG12N2Iga
 pMGHEHIICK1QL/DcTQdziLWuq2UHJ1ciJlepVLZb157VKuRNsel10rzcB74TuV2sEy4xxcunkCV
 IZOS4SLM+l3W7lIIQgAOnf1q9BcKsqVYP/lo4o5rR+0yyHNag4KYp4bmUBjqvLNbv4XIkeLUXvr
 1Wn0Pe3carIF8gAzLVGDAb3z/U79CoRHeCq9nkNafNXRqoUiZrp2cUFpK/FHJHN3ArfSkBsiQG6
 SCerY+Km7DE+I8XDF16T/UBhvID7ThlDuMihzv0dbTxXK2BdcuFxl+GpI9wNRbdLhZ6LqkRRXFo
 W1972eaNoQrrEZs+BLj5QoEeAJDtlSdi1Da4Wca/sNFPJaetDwqu++hQoLRqGMzDJ0UkDV8Wlg0
 yJz1e0XcM0n9LyaWc+dreUugIvJEERXWPklJ7IbPiTgRu32GT1UUohDyOEP4NuyqKb26ZdP6aey
 2vY7clq6GfdvFg1k2ng==
X-Proofpoint-ORIG-GUID: 2G2MwVkWmozWsagiibtxWOQ_dLqZs5cY
X-Proofpoint-GUID: 2G2MwVkWmozWsagiibtxWOQ_dLqZs5cY
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDA5NSBTYWx0ZWRfXzFJzFAILSLVK
 r5/IXABYYdT9o40mCtLaLjvuyCJZQ6O2aqBXhiAohLp8hOR/276FyHM74p6NQTIg1xUkBKPwBwq
 so7FNuDsKKYEY9PQY3JIZZXGTJpCF0I=
X-Authority-Analysis: v=2.4 cv=deOwG3Xe c=1 sm=1 tr=0 ts=6a5b47fc cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=mb0alOR1HfvJBB87paAA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_02,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180095

The init call currently returns success irrespective of any failures
during repeater init or clock enablement. Return appropriate error value
in the init call failure path.

Fixes: 9c8504861cc4 ("phy: qcom: Add M31 based eUSB2 PHY driver")
Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-m31-eusb2.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
index 0bec8657149c..275df38256de 100644
--- a/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-m31-eusb2.c
@@ -221,7 +221,7 @@ static int m31eusb2_phy_init(struct phy *uphy)
 disable_vreg:
 	regulator_bulk_disable(M31_EUSB_NUM_VREGS, phy->vregs);
 
-	return 0;
+	return ret;
 }
 
 static int m31eusb2_phy_exit(struct phy *uphy)

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260718-m31-eusb2-fix-666cf8c5a72c

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

