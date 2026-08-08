Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8096C373BE7
	for <linux-arm-msm@vger.kernel.org>; Sat,  8 Aug 2026 20:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786220622; cv=none; b=RiNOxj2KPnyyZ1mNcIlszkzOshVVu9ywJTHOv85qulb5Rn5KvcC980pUM26IFQp9IYr1EzkvKd6dckXvMtdMgrOmk+GPKamUim8iE51QsShNdhv24EOzqoR8r7Q75kxwmbIBYorFuYWeXZA9hBOdsvGbHYZ9HZt/5TdH65RgcOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786220622; c=relaxed/simple;
	bh=4ei02UymcNOSwF4Et78K90ZktnKD8QiRpdCSLrTGTHU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lsDFJ8Q4zbDX5V60wVKHfs8oDDdZbmosR0pR0nf0cksuVu2El9PZyoFWvpCe582M63OILdcN1/tHCGP84G+piI987o4SKgMIp570CPvDYB3FASWUQo7yMEhyDNS9KJXi5eCJBPQnxLcC4My0SKfJuLpKL2z6p/DUjxJqsQix28g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JPhDc+ta; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z0LS4fF2; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JPhDc+ta";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z0LS4fF2"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 678JwPEv733451
	for <linux-arm-msm@vger.kernel.org>; Sat, 8 Aug 2026 20:23:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3NG/0TSBU0DmDJU75ZDdFzCQshXmBj+SMFGbmVKo7U=; b=JPhDc+taFYk2XWsr
	WuTFFJFZ/Yl39ynf6sdZptUDQhCqnuTzxhmplOksHOP1VCqzMBrpQSPxO5mAsw8c
	gMROHy+q3eUydtAwnqUzTUHtZwsA4gnmcr9naOGcrAEGQdZupbikzTP/08Meiu89
	DpUoXe0KQh/HK20fg1CvNYbmscbB+4E+Iu3E8VeYvRoNHLB+DQbRy1WheZJaL47f
	z6nqBf6bpEtM7mC8+8o4YSXQMOCoo+/rC1XV1bhFmG3aFTvnq0Dq+1LvQQkwmwFL
	urOP68hdur+oaCoPHUl2e27N2YIrKIKcAGBjLj9cpRrjz7UbrWG32WGw+cPO4atp
	Ky30Qg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhv9n32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 20:23:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dc085b0a7so294165a91.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 08 Aug 2026 13:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786220617; x=1786825417; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t3NG/0TSBU0DmDJU75ZDdFzCQshXmBj+SMFGbmVKo7U=;
        b=Z0LS4fF2HNn4W5zFwH5oNm/kJbrbOM7Y2UZ62HLShMSCmmepk0CCHs7+IoHzrbeReb
         AkPLyttMuGaSw5I8jZomW5yj4a4x41qM5Zu6CJpLBdap12rGSRJ6KzxY80RiSg1hdVNb
         EN6x5AlmiYEfOF5UaWr0ygTOxStohBcBXXhk1BdOJ4vM6jGhf12NRXduBIbMlTN0if6k
         GeBVkEp6n1STmTybuFW+zfKTBUnVh9iY5EADA7K1uM9zAmJk+E/2YUdCshz8GnN8hJnw
         CcxZkrD1H56tswuZcf0fJAId1jMeYtu41wp4NjcrhnBM27Z+FWAALwWZFJGXr6wFgFkK
         nVSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786220617; x=1786825417;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t3NG/0TSBU0DmDJU75ZDdFzCQshXmBj+SMFGbmVKo7U=;
        b=kaH1N91CwvuF5uhte6jsvSwizDkJaCJ6NhPkn+PUwWEFdMKJx8se8J0fwIL+Qx2iN3
         pbxIle+tI86xToVm8pMzex0cPEFdQ3EOailiFrC84B8R64E2UuEk7GX1w9pxYBr1q6hY
         fKHUS1sLnW8Q0A9j7IWCsgkbukdayXGKUcg9eD0A+tfSIdaGhJlY4pef/doGRD2K/9/U
         ur7wjkZHoewoDp+SROiQVogcLMtelwouqH+xOIdwjiCjyaWhywx6VbFoyXfCyfhpVvsV
         NbrI1IOICjM1Wib2+hpplKAQlG2PIlxbVA2AuxdKvfBI9IXItEObrYLhr8EXVKIM3eCn
         vkFQ==
X-Gm-Message-State: AOJu0Yz7E3mmWQdlQK3+tsCDBm69uH8NP901yzrUBcnFveaV1d9NYurW
	CVJjZg0+MPDXEGz38xluqB8aAU2mPGTCpjD6L60mgRFZ8CMm+iBS3WsVSTdZLGaqEijiGQj7fRx
	Zwr85uuSGnIkZnhPDvO6hJz1ehMfVAJIjSORiw4qm80lTxhfTG6QZM8r+3rXHn5fR74CF
X-Gm-Gg: AR+sD13coQORxduNUj+pghBRRjw8ytYzTpfhH7y230Yx0U2+bnSixsxfegySPahy6Nq
	VdidnigTSq+xYlc82bDRnEx81Ma2L3YkgTNORG6RkWPBR9aFQII0QzGwuw2QiwJ0snPybd9MRBo
	Diu9/u5hFfSgAoYySgi5dQ3iM4XN5AoFIdRCDoqxOFMEZRBRLvLI8zDCJbuu+iNGhKiN2oP/aL/
	bdHkZJfP1onxv+Tq10fPZzNKGzauDKXXTp4NIQAwD+rbfAF5NGoE7EcjTkoAxTyyl4Y5rGV15mH
	7vkK9wQF49E2OyjurGDhOisIa7y1cuCmH+BozZDUjBi3abyCZzIBMMhfHsLl1gGCKAVQm+SBm1W
	+Yn0IXsfu6xKh90yV9/9eIEyt
X-Received: by 2002:a17:90b:498b:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3903c628176mr35483069a91.20.1786220617453;
        Sat, 08 Aug 2026 13:23:37 -0700 (PDT)
X-Received: by 2002:a17:90b:498b:b0:38e:7268:220d with SMTP id 98e67ed59e1d1-3903c628176mr35483027a91.20.1786220617000;
        Sat, 08 Aug 2026 13:23:37 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315be86e917sm26357417eec.5.2026.08.08.13.23.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Aug 2026 13:23:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 01:53:09 +0530
Subject: [PATCH 2/6] dt-bindings: display/msm: Document Adreno 830 GPU/GMU
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-pakala-gpu-v1-2-207ad1fac1c7@oss.qualcomm.com>
References: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
In-Reply-To: <20260809-pakala-gpu-v1-0-207ad1fac1c7@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786220595; l=1936;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=OsqXLb6DBAwwiK0M3PH5HtArLEFAOG7FO/WRCQ/j990=;
 b=WsOxEWLB8urgkOTr2myVNTvNfCf0TdxIL78Mb5G/oOX6ieWmoeLK0xXvFLwVvI/0aTrQ+4FUK
 BZBIJ/0BwnTAhQcEMpg+qiS6DnogVQGuiExn1U7fuX5UXd3zuHU+VRt
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a77904a cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=Kd7_WHXXByo44f3drYgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: hKH1EKV55s-i-dAAJkaPM6Dp2si9stW6
X-Proofpoint-GUID: hKH1EKV55s-i-dAAJkaPM6Dp2si9stW6
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX9W8apri4ORLV
 upRVyYuKvng5QX59KQOPAXP6Zxk/87Dt+EnmXNT8U//P5bfe+9XS5kOKrkdeOuX+O0zaoaJdgNA
 kXBAQQi6eYXSu072tRc0dbYdj0By6RUZGbLTiI6yWoZlOuwDdGhSxGzhBc/viXYPPu6fZGgUEoR
 WXfKleBLjkXNrHe14oqtZD9LB1Ney9LESCzFq+O1edpePhj+6hOcYC4bFBT9JTwtX5kLEWu/IgB
 1taBK4S31snrg6w2NvT5bjA3cUmg+lylSMsg2PbuAjIBjNVfholarz1LGcKlMK2J9+HbycLG8nm
 W4pHveD3dqE0ccC5wCupYAVoBj1O+ZeiQq5FXuH/8Lc88tAYJkyAwMxfOXhOtycdLvyXITQWUHh
 XbnaiFq2RCSjtWgNsoxjhFtgcC651FBiTiUaBAh4KYhhdv0o5RG890Bj2POZJLUmvRBMLUeFOKd
 cFE8pp2hQOSlw1mGvcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA4MDE3NiBTYWx0ZWRfX5pIQ4Bh2QmNZ
 8KQOc/PFDQcDgcb9npalQcekA4SB0rgS0WIT8Z6kpiZeCkHD/ktssEvPto94VzqNt+xU1mqgOXJ
 KqdbVJpWN+olgdlAvlnOx60ZS0MCHoc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-08_07,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608080176

From: Jie Zhang <jie.zhang@oss.qualcomm.com>

Adreno 830 GPU present in SM8750 chipset belongs to the A8x family of
Adreno GPU. It is similar to Adreno 840 GPU with some meaningful
differences like GMEM , register file size etc.

Document Adreno 830 GPU and GMU present in the SM8750 chipset.

Signed-off-by: Jie Zhang <jie.zhang@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/gmu.yaml | 4 +++-
 Documentation/devicetree/bindings/display/msm/gpu.yaml | 2 ++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/gmu.yaml b/Documentation/devicetree/bindings/display/msm/gmu.yaml
index 9e459f12ce3f..f1e609b7e1c7 100644
--- a/Documentation/devicetree/bindings/display/msm/gmu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gmu.yaml
@@ -305,7 +305,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: qcom,adreno-gmu-810.0
+            enum:
+              - qcom,adreno-gmu-810.0
+              - qcom,adreno-gmu-830.1
     then:
       properties:
         reg:
diff --git a/Documentation/devicetree/bindings/display/msm/gpu.yaml b/Documentation/devicetree/bindings/display/msm/gpu.yaml
index e5efe2d35ddc..1c4a6f17c1bf 100644
--- a/Documentation/devicetree/bindings/display/msm/gpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/gpu.yaml
@@ -414,6 +414,7 @@ allOf:
           contains:
             enum:
               - qcom,adreno-44010000
+              - qcom,adreno-44050001
               - qcom,adreno-44050a01
               - qcom,adreno-44070001
     then:
@@ -451,6 +452,7 @@ allOf:
               - qcom,adreno-43050c01
               - qcom,adreno-43051401
               - qcom,adreno-44010000
+              - qcom,adreno-44050001
               - qcom,adreno-44050a01
               - qcom,adreno-44070001
 

-- 
2.54.0

