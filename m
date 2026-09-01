Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3485E472550
	for <linux-arm-msm@vger.kernel.org>; Tue,  1 Sep 2026 08:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788250074; cv=none; b=jwbzoBlNIMDnHxq0Esh+3vm7KlA1C/zl62gRVfF/lTjsw9sdULOQ31XKaf7BTiJRZRDDNNDzVjTcINUsPS2auU6X+cZoi9hoT0jpMiMCfiG5jIPS3V4fuRU9/pl+mLODJBfaBM0crnTo2zYKH2J88plYvHDJLNUHrtaZixISu0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788250074; c=relaxed/simple;
	bh=XDmFQzdLBpSfWgObm1ICDjopUWVJ+W6chK7ycRQ3FR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JUhbisaVEgr8hSpCsy4LDsx8KvWqKfXk1kE4/V35krSCJsMTEWrqCAIomhU770cq7I3L7z0s52VJiuz7QlirCio3E7lcxEYVUhIi2QyedO/q62VntMLT3xXAi93lhbdRkxPwdF6CW++oFQEXYnlZggO/9XzcORD4Oa7mwZcLcFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jQ7HP/zd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FUKODyFY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jQ7HP/zd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FUKODyFY"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179RCo2322015
	for <linux-arm-msm@vger.kernel.org>; Tue, 1 Sep 2026 08:07:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2LxwHPkUxk2hXUWf5pdK4YPlLdQ5GGI7w4zMMH7NT68=; b=jQ7HP/zdxuXBsCI0
	iPrjVjh7JrzUXWKagUdvnU8Puzsqdy7A8nkEWCyiZraEKpLONnu6E/oArJxG+r0I
	NI/CWSzCXH3bCxjVQvq9Cxm3Fa++iUSFx0yZA8q57sMN7CBN3d4M6F40sVi0gAZe
	e3u4h9+wYkaGfYt7TYY82V+YkoCjDwxBpK7u2z/JrRqFee/zc1XPjSGVLrXsHLv5
	6kNpE1ufPVj7Sq0rGPmNqGZEa+o+r2BGv3JpWfAFLK7ROQps2BhdxiohlnzwCkxC
	aga/VbTKwqQakQ5z5b/Q1YtU981bmJc2tzQFsrUaTQLpkFvjr8Iax4UFIzvBpK3p
	pZuBaA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdfchau3p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 08:07:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e820609d9so885383585a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 01 Sep 2026 01:07:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788250070; x=1788854870; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2LxwHPkUxk2hXUWf5pdK4YPlLdQ5GGI7w4zMMH7NT68=;
        b=FUKODyFYv0oSs6o8Udc386BIUFedGVrMo7XEGQoJzX3BytPYLJhcIU/AJ8sZHMB98N
         PoQDVtR8AtncJ1TJCR9M3Vjk7+WqvgtwcUDMAkCWM6Zozw1HKu6iX5uVtskcUwUAdHnh
         GNiHB13ZYZUvKdLBEHuXkLzUpps1NoVOzW0EGhn2ObU1XHf+97zO8RT328s6QPAC5CdI
         Z3qmhozoepU1PSoE1SJziKFl1bVokjY85QrHFqdtUl19r2njnyVsGHwxnl5md/hYPq50
         ZfobKuMx4CXHJgln0ItFAPFGJO9JTnkt0OOpLjMSYf1f+HgVyzZCsnQC3WPx0EyGPu2g
         YCLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788250070; x=1788854870;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2LxwHPkUxk2hXUWf5pdK4YPlLdQ5GGI7w4zMMH7NT68=;
        b=NlzZW/uxi2OFMxOzRlfUe6bEeCL2EpmMYop/wmCXfF71Xu7C2909BIEsy1tdBMysZD
         6VD2E8AwisTF50luUE64OD7MXQaPCe9YQoRsDSdOZMyRaagC1tcMr1RUffeLwaenS+sI
         LEIdpLkofdueFq5B9S2OEPUtJt5+wIcXhuwHRPErWORxbsZrLJ6cub0c/gy4RwL6KTR/
         lMu11fZVyT2XerwKtJ2rZAbE/JMmrBHIs9VwM3iVVcsJw+UPLzI54ry3Mnv/g9bpTURM
         ooxBH/VsS8TrJzYPBpUig5/UQq0G5aXXN98+ZR1zEwDVVXYbdXZ6rtHyAHMo1i+lZsbQ
         HDyA==
X-Gm-Message-State: AFuF++lSbP6Z5d9LJGRuHeiAHXdTaNfeM6rjwmDB97FUsYihoHtDw09N
	osFa7weWzqvLimCAVADeQ9/+2Qu5eYPQA7VawMdjqbOgZaBIKpe4MHvsn8HqCS8s1YZT/J2tWs8
	sVCiTUeazsdZN7euKok5jqYnrY1cBWA1/RVeFQJu6Umv6De4MxbbVs9YmX/JX04LIX+4j
X-Gm-Gg: AR+sD10B4zqKsncESqCn2++d9tdB57xcf/ZcjYCRxQDKwSfSlJTjXeUCtCt90c+728j
	TaYzFnEgmmnNXlx1Ozlgv3Pd9X6Z720+Ei7itOGRT9xzW7i0rzZ+7JvkNcQ69fxuA00uoct8HVY
	GH8em8qkj9eN5642Gn+dE32imEkdmqCqZyYLGDLiwr8rCTLTKqnx+KPlE1tEWYAiaYdPSDXTTNR
	pzRkCU+6skPvO2OD/cJeadnds2gzXpmMBV00mySJy8ICTPIrzX8sRsDoXc6BNxVD6b4a7f+XObD
	WnZH4BkKIEJMT5vsDbXbt9kMgmsTxOU+Ne85E/GzO9gumWvrXzk8E3Ay9pNlwMYXdQF0l6hBL4A
	H0CH6LC57
X-Received: by 2002:a05:620a:2585:b0:939:10dd:9c09 with SMTP id af79cd13be357-93948132485mr810371385a.32.1788250070099;
        Tue, 01 Sep 2026 01:07:50 -0700 (PDT)
X-Received: by 2002:a05:620a:2585:b0:939:10dd:9c09 with SMTP id af79cd13be357-93948132485mr810364585a.32.1788250069492;
        Tue, 01 Sep 2026 01:07:49 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.178])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48442d3d2eesm3267776f8f.15.2026.09.01.01.07.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 01:07:48 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 11:07:05 +0300
Subject: [PATCH v2 08/16] arm64: dts: qcom: microsoft-romulus: Mark the EC
 reset gpio as reserved
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-8-f4ab7e4bb75d@oss.qualcomm.com>
References: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
In-Reply-To: <20260901-dts-qcom-hamoa-reserve-ec-reset-gpio-v2-0-f4ab7e4bb75d@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Marc Zyngier <maz@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        Konstantin Shabanov <mail@etehtsea.me>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ettore Chimenti <ettore.chimenti@linaro.org>,
        Georg Gottleuber <ggo@tuxedocomputers.com>,
        Xilin Wu <wuxilin123@gmail.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Val Packett <val@packett.cool>,
        Laurentiu Tudor <laurentiu.tudor1@dell.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Dale Whinham <daleyo@gmail.com>,
        =?utf-8?q?J=C3=A9r=C3=B4me_de_Bretagne?= <jerome.debretagne@gmail.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Harrison Vanderbyl <harrison.vanderbyl@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Konrad Dybcio <quic_kdybcio@quicinc.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1082;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=XDmFQzdLBpSfWgObm1ICDjopUWVJ+W6chK7ycRQ3FR0=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqloey7v7Cjf+8HBK9cHudRgThQP3P4yNa4RmPJ
 fhJZaVbDxqJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCapaHsgAKCRAbX0TJAJUV
 VkvYEACuwzphqQoD9Vj2HmtKJzv5rbvnN63b4HyM5kSLN1Ab6hnJOObHsHGGY2+u9VZ3dIkPouG
 HNR7We/OBbt6PkyYGYHjvw5JpA8a7mMIv3QmdWNlMpKlntx5i1uUMsMATCQvkAT/8taN0QPu+Lo
 rjMbsooz0yCB+VCmbnpVk4uov1o7DHVVX9/rV7rTFHi4V9WmBOMwHzkPBGXNsImViasFzg/wNHt
 KYN1I4iZrpGD64xGZhdjKj5HfZaIcvovZaZdKhLgiSV8hI6sXtsLfVLfmk2T62dJOaQ/GjgSgnX
 Tp1yDyTMaoY2+Rk0mZZlOwSeMc28zZ2kLuCj9R8Qb+n5U1NZSeAMHXfhgkEVvZWDzt2hunFYtlT
 k90IV6cbe4Wbr7SxZ2QpKsa7qk3xZYLAqmJVgnxVV2gbydyMEyKwmZDUv1c6sFUMoa1tKJFqDYy
 JU4DVjc+ckUz/o0Jry3z5SK8c4cwnywlztGhqbluUdG+kbEcmrPoyD60mD8wNlzkf2cDcGs0p5g
 ipuh3k7zqscL4ar17b4BiTJnmcVQiwAZ6rdVLArvtOCXdbkKzl5HxhAU/+JNLT97g4oU4xuJETG
 Jt3NOiKw3FxNFWDTIdKDgPBvZG79S02O4HseQrKxWYq8OWsAIFHOau2T9fsd3lbiQVtUQvjWCp5
 Vlz8nrBjSZe5+Fg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: JTMTHxCgDbpLsGC4KXZHYFSf9kQ7yCyj
X-Authority-Analysis: v=2.4 cv=G9Ms1dk5 c=1 sm=1 tr=0 ts=6a9687d6 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=G5ilVN+faPP2Ze1SHB4iFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=UFfQ5ueM2aPJ8qDrgdoA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: JTMTHxCgDbpLsGC4KXZHYFSf9kQ7yCyj
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX9dbXtGruHhnk
 7qiLrY6KtdYeMNS7oiFHSVGdKqfIvhHaAlVPbBeLhJXmqtUF3VIeQvxjWIpoMgC/F0SXNE9svgS
 BqPJkM0LZrIaeifY1pkPZX1RaRiLXko=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA3MSBTYWx0ZWRfX1fHo0cEXCziG
 bNRuBGJcEiyAG9xMIRv4sTW22t5BNYAWg+TpL5PO96q5k67iEk1VKyNdNE9z0so4cwSZ72iY4HF
 ByS5nU8F9N4VFP5L8nUy3pyNraHITxzlZc9tE9HeDkWtkP5ucMmsGaEv0L4ZtNCwfomQOdXwJ2j
 O2MUpVn9Kl2s8Hb+UEoEruwiJ33IVf4FUXSc7p77NZa7rmviU6r8y5/Q4HrihqpAvKtu7kjQYHj
 /u9rEnjI4zD7ZPJlc/2a2TRHYukA/u/iKwzRTH/0BNkiWafeszIttcMuk1gJLqHTvUw7WWuGNaR
 a2QIbLVKz//J9XQF88FRM1woRXsLIrVnUyrRGBUvvVknBzF5afm1ba7icLxSmrP5nirpV46WZdu
 Q/kkw+8VGyIVMPOY5TP/FjQreEDrpta5I7+42tIJVMih7ZhXXuR59EPCWoAWHQBCnf4IwhLJGGk
 i6MG5XSUs/z66Lu53WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 impostorscore=0 spamscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010071

GPIO 65 from TLMM is used by the embedded controller as its reset line.

On some devices, toggling the embedded controller reset line makes the
device not power up at all, unless the battery is unplugged.

So reserve it in order to prevent Linux from requesting or
reconfiguring it.

Fixes: 09d77be56093 ("arm64: dts: qcom: Add support for X1-based Surface Laptop 7 devices")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
index 13d0f09e0c2a..bc684c295b89 100644
--- a/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
+++ b/arch/arm64/boot/dts/qcom/x1e80100-microsoft-romulus.dtsi
@@ -1324,6 +1324,7 @@ wcd_tx: codec@0,3 {
 
 &tlmm {
 	gpio-reserved-ranges = <44 4>, /* SPI (TPM) */
+			       <65 1>, /* EC reset */
 			       <238 1>; /* UFS Reset */
 
 	hall_int_n_default: hall-int-n-state {

-- 
2.54.0

