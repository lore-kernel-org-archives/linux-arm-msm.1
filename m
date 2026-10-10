Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19C27377AA3
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791648086; cv=none; b=W8HVqbQeOeU81nCOmGYViXEtSug0d2XU5sD4E/NWt9lyeD5hku3sBAFo09nDIK2+7DMYM9laH/uvtjFNXeZXl9JOBfl3hW5mYQeQiPhs9QpSafeOV+H+zaBbb+P/7IAtT0TqsMo4c/oTi5jTQKm20aCLeTw8mppl4B5VLkq657k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791648086; c=relaxed/simple;
	bh=zsqdQtklwpvdbiVBw+YVSyi6bmJpPl6N7PlUwRG4pvc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KP1QCXMhW5zNuNzRHHG3ZszG5dzbQ5Uj/eMFYq1qWZN6JjBJNp76f+zdNqUuynPjvGp06cnkYvgu8ZObsTdt505AAT/4lMMkTbpVS1x/e5Hf6CHoRAqt/E6CHu7qV7Glj6gciHBT6yB9HAaJaCO/t5AVaxNd5oCaW/xzvx51sAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Iv/HU4WJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C2UdMk4x; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Iv/HU4WJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C2UdMk4x"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69AFQME64141263
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=; b=Iv/HU4WJYup20Aow
	9fPv25J0ElIW3hxKoM98EjBVaFalTAepIgZEqinJnH8a51PKoNC1CqRDMouXJrc9
	jr75dKgAvnjWddj3OnCGK53w1vGvcD5uwHjSPJWqstTSAabjwaghwIKRVm0H9Y8c
	Fw03dGOzzCwT+/TD0I8rWWtZy7ASDRUuSNVhZxKRw4z2Mzck8G5mv+xO0iCiCWFG
	2XOq2DZui3Tb6jksubP6/fWPaJSDv00FQhRuxg+lQgV24iGSiEgqJ9APaNMHmbxh
	vqB5I4dPeVnlbq0qF0SLMAc7VNijCRtVrGOqrqB+CT+KtAl2ipjyZrdeMbB3SLcz
	BjYwTg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dr7ha5n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 16:01:23 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-34d49d8dee1so1188047eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 10 Oct 2026 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791648082; x=1792252882; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=C2UdMk4xJh93NddLu8vcZbXxFauhvDrlHs7xsg+MG1Welv+8ZFuEwBlYDYfFfDy18G
         PqbOzHrMgkLimfYC/KWg78fvo1d0pytSzTqkBQ4hyHcvkU94gfVtc4hDoW//WqEw80rn
         +NWcn5kGAdNhwCLLtiu5OGOnlsM+l6cPCY4rQXbXtobgnnLskzzj+2XO89ePHKVLKOG0
         5Fke2YTpWpkTus2YPjmpPZjv63TJyQ11E1LXyOlkm/I3q77sjL1Y57xAJddTq6GA1NIc
         45gWmePfsehuS3HqhM5W3XEe/HEPNwUX3fEZTF2OhdRNeMb3koRyBGLomFgfA4cIHBMR
         l7Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791648082; x=1792252882;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbiNyzfqx0jGWwabN/+ItDIDzhYhWzZaMzG7MQNpHsk=;
        b=AbpV906t61EV4PSa9ImgtsPmrfO/pOLcZtNY1aKpy0q3b8sXZgeRVJ2fzWqH8U/nSE
         SKmZWntyhdX5o5k9fK5EDNPnfHTxj36bmq53NFNnc190X92ThjvozYWUwmZftya5W37U
         sPUrF6ZFWIbA/NroO7py3EVgnvj2vkSBS6fO3W3jo9/jya1tVT7EwH2gbE6vCkZHnQb/
         hm6beAq3g9ZHSIWLvOvQb7T7Ynx+W7+2Q2+BxK75+N/3yCTtc/JKqc21en2Yeo73qhKd
         bW961fgw0BL9+9wgwWuF5coE+vxTvDYtiXRcLJqaXoGDH/otEoZfTOlPmcZ0Bkdn8jVU
         wSGw==
X-Forwarded-Encrypted: i=1; AKwUvBwSoK2HvH1N7TqLrUar5AAOt6BAlZWvvvCBN4+QMWIs6+YNzgkh97cHwTyAExGO4wJ/xm7Xd+W5yPMDh/YP@vger.kernel.org
X-Gm-Message-State: AFq9FYIVJZaJHJUkfEsAyo1agfdaG/4lBNTdwKU42IJ1v/R982xOTsQY
	0KaSt4wbXR4sgCknAlMuaulngodmO3tPmsNwoK08ZKt3BUcUAmgyJnNaYZTylAn/70ZGB67JTb3
	nMlS0ZtIFpRzQG4qW+vTRB5xITqOmVKmhG7z67vUhUzZ6ZpfCr9cVjdjOZ1lZjq8xvmxz
X-Gm-Gg: AYBFou3Z0gmI7nHPz8KdFilynxkVcR6JAn7+xaWF4bs9GRTKB4/r4Z4LoSCY8/ZsO4i
	QJwRrQPEHLg8v7TRa3zN788cNR/aKUHgYRy3JAvJ3K4W1lp/Yoiazkpjpny1KI+J0uB8XvjRpTN
	K1P9boNkiLNOoao84UixOr0Lk+BLEAfb5wu75+NV3jmIesktrBgP2RMpRhpNJKWUDEa4f08Eywf
	0TTnO6yfCK6zJFyfej0E/tEZp9XO4kggkAYrl/FaeUc3X+Wias3yAzLyfD4BIxeXi/sTQU+v/2Z
	A6GDDkZO5qJabdh12GNz9GCLnlm7HyTz4xT/fpQC48yByfTnsvfagEq6yhcLd0UsCaVP+9to+af
	5XMWna/zdrbDcm5cQRNwclOriFLv58ukydqSO2chhplZMqn8mB/c14TONxD28ZZMdbT99PXMN9K
	VS4nT2qGcExA==
X-Received: by 2002:a05:701b:454b:20b0:144:fa79:174 with SMTP id a92af1059eb24-16a61f45109mr6363802c88.44.1791648082009;
        Sat, 10 Oct 2026 09:01:22 -0700 (PDT)
X-Received: by 2002:a05:701b:454b:20b0:144:fa79:174 with SMTP id a92af1059eb24-16a61f45109mr6363742c88.44.1791648081353;
        Sat, 10 Oct 2026 09:01:21 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a31f6be0sm30786022c88.13.2026.10.10.09.01.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 09:01:21 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 10 Oct 2026 09:01:06 -0700
Subject: [PATCH v20 01/13] dt-bindings: phy: qcom,x1e80100-csi2-phy: Add
 Kaanapali CSI2 PHY
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261010-kaanapali-camss-v20-1-63e98ce9ac0c@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
In-Reply-To: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: dcP6y4Td-TR1fiwEHJBy-NnQujf617xG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX3tJpPzab7Gh4
 MqE232FUj4/SbZZyDr5xTEs8/m8ekQMbgtHYzIYlMan2ylrHeXs4LE0wffqP9mhI0YZiZW+oa+I
 EmcwjCRMqry98MSj8+JftfcXl/yDKiw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEwMDA2MyBTYWx0ZWRfX5um0HvNQaL1O
 PRdufpTJc2NVS59z12Ypz9hpz6npjsiuqDDLjuutedvOdaliGtWGugVQpwewKIVGdzFGnfF0QeS
 Z7/lPrfrSeP6TIW7UVuG5skoUqtsdy5hqYrFyLIOWalMD9k7L4+fHVOraSZz/GNLDF/PdSJu1J5
 21zP+lglBrevKthOwqlwUZHEbaEv3DBBZJnhv53GQWJECMcZ82+exJ0m5tXB4TS7Vo1f2Ds9XIv
 VnnU09JYfzkLlQhBdRr5u/DDKsW6RnckjnqbZQOR+5xUV+Qh3ABmJUkN6X8pCawd+3Rd20MMoTl
 4J6tRX9S3NN+pRCImA2wlMs/bBbBnKkV1/oEbCNEnK4uUWVJ3WeEP5gbbNnAGpvkdLbH0lIVmaC
 BE+jSOJ4hx5VUXo1cIzpFJHNCGU8MTD+WU9OjkZ1e0D80nHj9Bt6thnu65+4GG/EJp571l2i271
 2QwIZXBb6eZiDIfn/zw==
X-Proofpoint-GUID: dcP6y4Td-TR1fiwEHJBy-NnQujf617xG
X-Authority-Analysis: v=2.4 cv=asknmiZV c=1 sm=1 tr=0 ts=6aca6153 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=mZPZtqNPFm0sPOGUM0AA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-10_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610100063

The Kaanapali CSI2 PHY is compatible with the existing x1e80100 CSI2
C-PHY/DPHY binding. Add the "qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
index 1f1e2a4993b2..6e9eb8e265df 100644
--- a/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,x1e80100-csi2-phy.yaml
@@ -17,7 +17,9 @@ description:
 properties:
   compatible:
     oneOf:
-      - const: qcom,x1e80100-csi2-phy
+      - enum:
+          - qcom,kaanapali-csi2-phy
+          - qcom,x1e80100-csi2-phy
       - items:
           - const: qcom,glymur-csi2-phy
           - const: qcom,x1e80100-csi2-phy

-- 
2.34.1

