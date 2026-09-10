Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73195493D21
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789045312; cv=none; b=Uwg9+x4U0cUdgZMVk4LkQjZTq6LL8jkEDR7dwV6IZ8kqfRGW0xaBHVrn2hdZdNo5vdKlvyFy5Ebe8wYOSg2jVMj3kvjT330DrKzY0M7IWIvBwNY9cQzTJWNIL3LCsk72J7Los/OT1SijAVPR/MswFuqvW4Pc6u7UgpR2/kHfvac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789045312; c=relaxed/simple;
	bh=XytiMa5fLcLcaPGL3M1duTpYUfhHG3JelygOKP6fjNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1lbvKASkfV/z9sbuJtz5OIgtFKgy6O+Y+zKl5veHQN+UMTfS+jPdeMco/Wj6HFOi09QOV45ZMvrB+59S+ENHupL6O6YE3gOxviJPnc/Z3DcNG2EX7qCRDF3auEZzaSNycr5yJE6HTlXhojzR+bzXWJxZviYsXXCzk2fKWiOx6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MRR5mWrk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E+PS+Vaw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MRR5mWrk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E+PS+Vaw"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68AC7hVn869072
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9y+j0WrhcaTeosIVoQO4AEPtqrqZ1qq4THTfq6/CiPI=; b=MRR5mWrkw7sp8mrb
	+st2fTWlOsLe8lbB9suYJkmM+1KixoDyRS9GRUgWRKcFJmLZbi7zIxyxM7/ob7Y7
	qzhr/dzvcDBwNWNNusGWVTv5uC/NV29LDNxqDnf0O84tTobDYCFIxFyffL7VM/cJ
	QvF5t6qtA/BVh5hSQS2tmRhbkUrfgTVyTBknzDS1O6UPggTc0BbBDzHWRJC+87oQ
	aZTEYOTCRXFRk6cjObUtEFYKQv1D921HO1acxRGOlc/+CZbIda2yMsjqut4sbDmi
	aqjlj26YIQWnaERXcJ3r54sJGbqiextkb2g1ndRqTvMmAvmWheKhrT3xi9MhkjD4
	D41pEA==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gkcyd3vp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 13:01:48 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-97cc46a7765so693253241.2
        for <linux-arm-msm@vger.kernel.org>; Thu, 10 Sep 2026 06:01:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789045308; x=1789650108; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9y+j0WrhcaTeosIVoQO4AEPtqrqZ1qq4THTfq6/CiPI=;
        b=E+PS+VawH+lEEhK5/D2ffJH3Gk1Zyw1xOVMl22/vKrY/8VgVdUSlR2HmcLCJujr1yJ
         0a0DR9Ds1eFKmm2hhq0wbQGxhq+i7wRImKOIU5QtS/rFMcSLdyl70uQAAqT3zoMIbEU7
         ZYS1t0FhtDKNUnKFtAtn4/wUeeY3ay9/ZnBeunBTB52vtpQTJU07TOBC//7boGPofr/b
         BijJ89xT9Exg57bsNNa9dSWuob2LwwWB3kTMcx+GmKxjsnynhtGUveXoZXhpyW5alGv2
         H3DUHV2njqc8h9wTAU7tUqodiyZOcpQxMVyyfb7jD1lqaqKKfgOchjLTNwaNliMyu6Oq
         0e2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789045308; x=1789650108;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9y+j0WrhcaTeosIVoQO4AEPtqrqZ1qq4THTfq6/CiPI=;
        b=pizzjM6sm/L1+ekkWYWxJeqUB16iT/NI2TIvFWie81PdKYQC22yoxbdhFB1C6Mq/FY
         nbafpbVgOM/f2n4cIjNaCBB39E92L3yXHq6NCPFeemnEMJ6XwHS9ApeFcp6xMBcfrhhd
         EsDVAWupj/LKriT0QR/Edo7XPaQLN+lbpICZExRAi9nGGvY/NzIDlBpbCZX3N/vM+BmZ
         wx99sp30PaBsD00gCLDATXSTOB1gKKMfiPEp1lyUtQ6Kmp/BlZUFm61d6j7BdfpiPOlp
         5W4HCmXIQ+yxx+WoA4WwZyi5xgMY3E2VT2RI4CaE60nOsaUzuQYPoARC74ZjzX7kuBcQ
         hRdg==
X-Forwarded-Encrypted: i=1; AKwUvBwJW/6AyftelGFpZKqhosQLNWuUcAOA5cUp4a0vQZcTrILkCnYPSZ8WiOkSMTKMDipnQBhGHTPXMvobLDpb@vger.kernel.org
X-Gm-Message-State: AFuF++lCoE/DwElIPy5L9yR2yBdAlQxOvpLDIf5a9IVLC7w2+MAc5I1K
	sa1Z9s9yusmvsYCH84S+OXYnCmvG7zix9Fk56E1aiC1bJVGdVBgAHo+mB3GjNlImtO1+KTWatNV
	68D5DK39xSJsFev288PMLooUjpYkaFDBe/rH09xuC/XZxo/7PMeuTDVx8sbwsTAqkMXVcinL561
	b0
X-Gm-Gg: AYBFou3mkjC6hIvSlgYiHGa87vqYEayewCd2WZm3+KLWx7L1a/8AIwEwRHo1R/0/Nbo
	GwLxxU6wsFu/bfWMqdCAuxtFKGFc9NvD3jkalT8Di5lyXD3/ZysNuiTNil1ATXwwDp9ToqYxBSo
	lUtKx7f/eXTZSj4Z9X/EPSLGPXMpC1IBFl6u1jsDC5nQZ4cQRNP8RANwkWKkATWo4DcQ1eKwc5q
	qZB5RgnX34F19OeTq/ItMtZ3B/HjKyL6td+xnDKPQ/CA26wkODpG5FQdE3/rP2sU6uEIINCOJ0f
	zefx23aKnmrgeEL87++a8IZBwaptFSYG75FN+peGTrsm8zqbqPHLWXk4+ozWCzrHbKlwLICaw4t
	IBMGoDcjkl1MhrjDXShw8UDYIPZ4x
X-Received: by 2002:a05:6102:3f87:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-78f7380daa6mr4474227137.1.1789045307043;
        Thu, 10 Sep 2026 06:01:47 -0700 (PDT)
X-Received: by 2002:a05:6102:3f87:b0:780:7e65:f0ab with SMTP id ada2fe7eead31-78f7380daa6mr4474097137.1.1789045305373;
        Thu, 10 Sep 2026 06:01:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:c9b1:abfb:f300:5e98])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c26204ecdbcsm831849866b.25.2026.09.10.06.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Sep 2026 06:01:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 10 Sep 2026 15:00:53 +0200
Subject: [PATCH v7 12/12] arm64: defconfig: enable the Qualcomm Crypto
 Engine core driver
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260910-qce-fix-self-tests-v7-12-cdbd2718af14@oss.qualcomm.com>
References: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
In-Reply-To: <20260910-qce-fix-self-tests-v7-0-cdbd2718af14@oss.qualcomm.com>
To: Thara Gopinath <thara.gopinath@gmail.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        Stanimir Varbanov <svarbanov@mm-sol.com>,
        Eneas U de Queiroz <cotequeiroz@gmail.com>,
        Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Demi Marie Obenour <demiobenour@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=XytiMa5fLcLcaPGL3M1duTpYUfhHG3JelygOKP6fjNU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqoqoUrCFfw/iAqEZLzK2v3C4rvF8NfOJ9iaf7c
 3KA62RFrlWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaqKqFAAKCRAFnS7L/zaE
 wz0nEACPCIp3sLsj4aRZlzCbLYit9IwxonmbBkqcEq760f8h60L9eE9t0yHHjUfOil4qhUE8p15
 Bw5i1QId33cfrfJZbIbp9zS3xgC7x6nxUuYyjsFbWeRncWyDLrQZ//NLPYwhi73zfj/RySl1Dlk
 cLMFeRghi+VmOSQNX/goJ0vuvxK8XXoITqDH0rJ84eiuUT6uBvnBqxd7/3B+Q9+qtX+0lCYaDjA
 GlkvgwPl3tC7MqM73SPNI2vMgfg1BXRi1WwDQxBdxx8V1MiFTri6SwOXty2dmgqFCeiohT3jAul
 +bzh1leY9oWFv3zBvW3Q6RJkQY5m+s442XUYWpfI+skPkZA0N/J6d/VdjvBjqSCVAf03XvjnHWo
 gqQSBPzqUVUfv2r25ZSC/XMjgbkZbUSAqbQj/3tpPZBQPUb7OxLGnwf0qlaOpjNuFxM3L8hhz7A
 utibAbZQd0vQcrdwlsNAVNO+xGjm/01UJCuEP0Nipk1/VOyQjaBpKvy6eX19lAq14mO6r+Ryona
 JG1IkXWLcarVeFY5unAZr2YeRU1SZLwXoh1bUiOU8tjWw/+J7UCyr6QH1rs08osvlowFfkb3Ym4
 bsAEDli70AhlR4FUw77XGUDrWrRGxJkW9wMabWVOCAPv0DA0s0SFLNoTSiA5nqeaK4ChyBzl12a
 nd/sknNMqkdANkA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: qEsc60XORi-1pWuPpbBK8waSWlYExU0-
X-Authority-Analysis: v=2.4 cv=ef+o7LEH c=1 sm=1 tr=0 ts=6aa2aa3c cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=talSHFZyAPOHLlyXONgA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-ORIG-GUID: qEsc60XORi-1pWuPpbBK8waSWlYExU0-
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX9LanDnuLRbOx
 gBy1AIoXiyfBmD++1SJjVEQOJA4BualE5A3rz6fRFwHE/msNmhpZzb/7DRkYd2BlqAJJgx8iNRA
 N+RPsf0/iliQr7oFI9zDkxIEcvUx5FU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEwMDE1NiBTYWx0ZWRfX0BfrFOrj2fJP
 xKGae+DsNyXmnYw88gnjmfOCekuBWZor5dlwtBNeXahHHswQ2XrzsvOON6/FJI9ZTDT3/VnZeoE
 EfU/W4e5xHVOIVMwH8zgW1FipbGod1PYYhptrBpgCBg/gNvXTSxJ4IesU69MdMUUMRs1/e028jc
 v4rLhHVytklY55N8bJTO2vNuJWBtir772p7U1rT9K5rgFxpBetRMUitC3Tj8Eu2DxJj+D5rOr5g
 gul1lvlFqK3J8WjDhnxZdA7TJcopyqed5HSpuyyZgOIndfOBW0dtiwgVM3gvkzuzTaDGTBVY8Q9
 BM+agjcMfEpPi3A/kyqcSKQo9Jl6+oBjqIyH1ISAvpHrwshUif/fFzJAXDXHWVjHSKwZMUJYSm9
 oFnFIIat4d0IsbF16M39lTsHPORCia+aRd0lp9YYwXjUFuaWFXXnmhCLpmwTNK9LD6YAsbn5kfr
 xYLxBW0AUw0rXKE/2/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-10_04,2026-09-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609100156

The QCE core driver should be enabled by default as it binds to the qce
device node and scales down the interconnects if no child auxiliary
driver is using the IP. Add it to the arm64 defconfig.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index f0947c8176a16b2f0c80b17ce8820e4820c77b3b..ba9450d3bf024475a92d13ecb8e21d3faf4f63fb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1666,6 +1666,7 @@ CONFIG_QCOM_SMD_RPM=y
 CONFIG_QCOM_SMP2P=y
 CONFIG_QCOM_SMSM=y
 CONFIG_QCOM_SOCINFO=m
+CONFIG_QCOM_CRYPTO_CORE=m
 CONFIG_QCOM_SPM=m
 CONFIG_QCOM_STATS=m
 CONFIG_QCOM_WCNSS_CTRL=m

-- 
2.47.3

