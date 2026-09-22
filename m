Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B696540BCB8
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790118391; cv=none; b=Dl1vMOGExy04pVAp8cRJmhzjq4g9b/1yKD4QXovX6X4NGppqdy8uFMkP7onDwim6BG/B0rgCtmdZaKdiSkcPeYUgqCT8T+h1Z2wOnuSnp6xU5kTyGaUOhja7TkaovgxslKRZV5Nb359cxoo3XPd6GN5iqha7qhKQ/+3X3FkdP70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790118391; c=relaxed/simple;
	bh=YhHDPn1w+fGHVpTXcMRfO/BYZaq28nhrK775K3W60Gc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ncI1Y0Lq0JXSUUpaoGHE7QDmLbfxLTIiHFJWPs3DNLGEI4fO1ScV32UM4mTT3z0w82gcCzWXtj0AhV3A8f4GElMZb4AZ3/cTAgRmbdB8nDvYk4VVUoj1/McnwZ5tR+/mROWF5aufvCN5D52ui0nQqwVplRafsKElBtswYlP6SCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MWokzUl8; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JLyS25uD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MWokzUl8";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JLyS25uD"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7FOU368086
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=OMMlMgnS6xl+6RSHGuHaRN
	5YIWe/23hApHhJq6B6Z5k=; b=MWokzUl8Cdp9pZ1yRBl7Xu4kDMEk1TfDy2fwCE
	qVbXkCVHFIKAhByW3OhMV1t955k9Z0ZUTX9M+grOjBvOIT74GojVlLx+fYnjAxQn
	xdOcKA7JAksDO+288mqDTZ3IavslqZ73QT4FkJGZpOQlchqNWjvoyw6TV/hO6oo/
	Xpi3OZvsU4Jx4qEunh3JJtzGincg3z2Jm4pSvXONCBc/snQezE7+QjPRjqryAQ0o
	rSgBT8umppABZxfdUA/mIWeJ04rE8n09IrNMYQqU18xyXIX666OCjtlKzorv11S1
	tIz2DKk52CxD7OlxYoGJVeqaFvkp8Eym08q5faGyOMhMy7DA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntbcwd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 23:06:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-33310847fcaso496474eec.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790118389; x=1790723189; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=OMMlMgnS6xl+6RSHGuHaRN5YIWe/23hApHhJq6B6Z5k=;
        b=JLyS25uDupF1TduXqjRKaZrAXQ70MggZz2gnEH9SSJp0hn5AO/KmGe35qHZO8zNsnG
         H5QvWjnB6FWwKBdW4CEY+g6Hk6Q9zQTNTG7oxPu7N2TEF4M0g1g9Rxp7ky3gGyGZgFJd
         Dfj1KnHfqWTjhPXD12inoK/9O6rXisuSoluuCaIPoJIiQxxhGndcih1gY3eyLYGVXQrn
         BwICIEguoWmy3pSaj7KF381Yzj1RUcvLqqwPEO9qFq48stjiYAKsChzypb8abjg2DSc9
         m7Imeb1ENff+XMHDzQ9sEN/9ZFAHFN352zWJXohF+rwULdlJBS+QkRnp6Cc3KG9qGUNH
         4Dsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790118389; x=1790723189;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OMMlMgnS6xl+6RSHGuHaRN5YIWe/23hApHhJq6B6Z5k=;
        b=wID9ygIBdX7cV3NaMV9KVtpneAzy2FcpZOkL0Spb3xqvBAe2gI0Et+W9dT5O3V++sr
         ChH5NZ5vB6lhhmfm3pOw9ot1ABxMc1b310RD0EvoyYVHoXA4NL0P761lZH9SsoQ7EfLT
         TzeGboF+RFsjz1LrsVwRuYzBa9olkYi0X1JbOz7O0ePxMrl2GQihKMei4XYMgnG21XmF
         XZyIPeFwNhYHSWHd6nyYe5EnLBg6Tiuo35SdsgQwbMlxw0eyJGkzJ9akTUoZgufkdjUw
         WquNbKtffH/g0mB1PJO85YU4dvsPJQSrwdravmW5YMb5k50JStzC+VQfoAMYT0x8CJIs
         3mfg==
X-Forwarded-Encrypted: i=1; AKwUvBxbT+qr5hXmQ4IN/H1EzpsB+yO7fisUXnE91K2NTbcXaUhnv2KmpXIQsWYl1Di8tRy5a6XScVCgfVld17vT@vger.kernel.org
X-Gm-Message-State: AFuF++mqdfEkRY8mHrkO7/o+hsfk9UXHZ8MF1puUfUmF/bnCR6F01QT7
	5bB5LHdgvR/lHQMrb2wpbcDsTLPOZtBlUgT4AOhbvSAIsNfpwQDyNfue97BWqLF1D+iTUIBOTfF
	Jl0txbm0yR1YYnKh0xuUYZw0SC3CrO0KNiZf+DFKt5hR59xSH9DEUq0NrrXy4d0ajmaig
X-Gm-Gg: AYBFou0Z6Wu7Dd55ug7ucI/ndR33C0WgjjoDEhBh+hTwHyIJ/yTv3YRZyuvuMdCsY2j
	j5Ih9CmD706qajJLKWGY9qXOoL/UQEZh6xb2V3mZQLcUUXOntX4W6C1WNncuGxlQF9252CPR+fg
	vS3NUHp7FsJiZ5NVuz9JZPqTMrr/XJ0B0UMSRngS+VXaWXTRSEPPRtasW9WnTgM+Iv0usngUAT7
	2kiybFMpRVQ6fEtZ02pMS45VXqrDgn0rmjOq+Ig1QrqZ5hdY2omSalf1EUR/lnrxtCoSBhD9gtp
	bu24G1CvWzoNZ+z3HQ28JM5lMYnyX+GrqKXGKcOP9xUmA+YgJzCrTVGNAkd7j3KGchyH+yg3XSY
	ldwDaZWr5YS9XxWgoc6XwZCKkbf8Vk6uzg+7VPb9cnbvdyYB2xYZ1q3azLG5B
X-Received: by 2002:a05:7022:ea8a:b0:13d:974:a42c with SMTP id a92af1059eb24-144f9087209mr983549c88.1.1790118389151;
        Tue, 22 Sep 2026 16:06:29 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8a:b0:13d:974:a42c with SMTP id a92af1059eb24-144f9087209mr983514c88.1.1790118388522;
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
Received: from hu-jingyw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-144f983c5a1sm1737515c88.7.2026.09.22.16.06.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 16:06:28 -0700 (PDT)
From: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Subject: [PATCH 0/2] Add Qualcomm SM8950 socinfo
Date: Tue, 22 Sep 2026 16:06:18 -0700
Message-Id: <20260922-maili-socinfo-v1-0-a82bd7d4ca77@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOoJs2oC/x3MwQrCMAyA4VcZORtoMx3MVxEPaZa5gLbSwBDG3
 t1ux+/w/xu4VlOHe7dB1dXcSm6Ilw5k4fxStKkZKNAQRiL8sL0NvYjluWCQq0x9TD3dGFrzrTr
 b7/w9ns2JXTFVzrIclzDGAfb9D2bUik12AAAA
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: aiqun.yu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, yijie.yang@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-3d134
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790118387; l=557;
 i=jingyi.wang@oss.qualcomm.com; s=20250911; h=from:subject:message-id;
 bh=YhHDPn1w+fGHVpTXcMRfO/BYZaq28nhrK775K3W60Gc=;
 b=U4nR/uq0WrGtBKVMnjdZyXqBRdKzO6/z99Vrf/0T56CSEKLtkPWWpLpExay1yd4ofY4ZV56MB
 CbhZQDam84FCjCDWsKcLwGOSs8drY/WNQ8mVC1oxCt+DHzaUUJ7CsNz
X-Developer-Key: i=jingyi.wang@oss.qualcomm.com; a=ed25519;
 pk=PSoHZ6KbUss3IW8FPRVMHMK0Jkkr/jV347mBYJO3iLo=
X-Proofpoint-ORIG-GUID: ZPaay0RFz9JhwBKxbdeR66Zo0kYSgEi_
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab309f5 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=bZKhxiC5GNGfeMcMCAUA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX7w8PTsEpHilk
 rbUfMGEflNwAR8cb/4PbBxKaQ/mtDUcVdaYWLsTgORMv/xY2bb892GBfjoR/sBLd86d2vhVMCJF
 DrvbLCDr3rxiGOQnsp8yUL7mJ6D0DBGmq2GDqYU3oQhv9ybqlv3VJ/ZyMd5xNl3D5XhLo3DHEXZ
 vvAM4kMhzn1HqsOvnDBjc7yNYUlKLh9L3Cc6mX2Tvd5NRHll+HuaFr00rlt6PQtswXjV7Vt5F1r
 +xMZsxMsdT8PUwebGsxPtOIkhm/qiYjjVyZa4wqnZTWfRtXqATRlqK2uZNzN5g+ZZSTflVr36tf
 4YVG1ZiYKNer/aIU7l6vePApZooq+kHZ2OZfLuav6haKae3kEAkCVZEgmm6KBjx3QZbW6MZAOE0
 sEnb9mcsZTZ15KCYH9Y79pTUDjqE/P+83YRNXXRRsht70HU6Ymx3TPkAms3+im+E7Nzi9HDy0MU
 W5NyQJZoIeeXkgqH7jA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIyMDMwNCBTYWx0ZWRfX5FGB+cwq/MW+
 vpYwm4frtda/800dHb3fBJftdHgtJEtq53YQzK4ke4ViICjacHN+/+msHwr8viaoryyv9bCG5Cg
 t5LcM9nvTvLEKXtV6k46I0NiJeabIv4=
X-Proofpoint-GUID: ZPaay0RFz9JhwBKxbdeR66Zo0kYSgEi_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609220304

Add socinfo for Qualcomm SM8950 SoC which represents the Maili platform.

Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
---
Jingyi Wang (2):
      dt-bindings: arm: qcom,ids: Add SoC ID for SM8950
      soc: qcom: socinfo: Add SM8950 SoC ID

 drivers/soc/qcom/socinfo.c         | 1 +
 include/dt-bindings/arm/qcom,ids.h | 1 +
 2 files changed, 2 insertions(+)
---
base-commit: 0d9d0dbf2fddcff5859d623e90ca73c4054276e1
change-id: 20260922-maili-socinfo-0c4cd31b325a

Best regards,
-- 
Jingyi Wang <jingyi.wang@oss.qualcomm.com>

