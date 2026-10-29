Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793298835;
	b=Q+DHzYnLnqII66Nxh/oxCv92/UnlQY3ewmEFr9BvxFc9hoSIShJAZk4D3LlZWhTHlZNa
	 809IlxCB+m65x9wDbBsIfM+pAsAuPnq3YFWFhBbQ0dMvpmahH4P22wPUKROkDq7fweRdg
	 sn1kWskN/qIxOV7pnDlykqFUJ4aoGZWaP0hEEeHjDqXEiLNw0yz/wCJHt4EWQNtvRAEVb
	 XGXda1yosFhjx/PwK8MtJl87/OwWnEAXX+/b/c++YaOx2kIwx6NSC6+bWHJjPSuL8HZEC
	 dx6WsPyDKA1JM2ajyqCel64aRL+DUJCKVUjUoNRrlDtbYY6NSfEfq/NlZX53lc72/8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793298835;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
	b=gR26jmVOmCU3ggKF4mDAiW67KLKCWj036DxV8as3gRnqsdYD0VdgcODFMKvfzWFL5MXO
	 HFRXFr3z58j3rlDGK6P+vwxHxgwKpPfiYO7+gzvVjMUvZvYrg3WiV5avu4Eutrq3MNoH+
	 vGqVU50SziA4s5yp+9VryW37+SaOIpF379BjogRcIewVfijzUgltlVPfXkmuH6hrKxbJf
	 wKn0ZGL01hCQAeTDev63zggXbnOtYLNhCjN1XGS60uI+J3Rfxe5Lx7LG1wOTIyRQ67t3n
	 57FwChoCH0P6VcF8s7me1bArDFeb88ymcRRLWjdjvpJ8/Sp/3XLjEQOO8S8lMqaEcbA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gesxsjQu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7jeFvKN;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECEFB606A31A
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECEFB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gesxsjQu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=T7jeFvKN
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69TGD2un1620505
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=lDtTbVbyYNnlkmw4q3bNVv
	9nL5pJLpez//J97uSfoTI=; b=gesxsjQuwzLbvq6Cs8vMUlB1GXsxgtJh1kBhI4
	cwSVEpfdZFPNH2w+Mgieq9GWq+KvnRhEpD94nzFmaehIPyLDInvCFGG7mRBIu9jd
	jWPw1eEqWWC9ri4OvWQuZnVHu7vflAhYH+dy7LPLn7SJRjjrxcFzPCtDj7bwuPpW
	/L6JpQPDabTMdvrBCVjyM7EeaJckEnP0TNPipekt98JHUF7beHQdlqryCOLijUQx
	DoJgNaRAGvzZW26u93P6L30iZ7HrVjyO8IosiUfgi0adTjl53dM0+oKAPDQT63nF
	gRITb4z2/I1dzFYTohNiRwAR9JOV3oemNZbQ1lNXcNTywiBA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hm44qa6td-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 18:33:54 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36a1e2485fdso4975598eec.1
        for <linux-arm-msm@vger.kernel.org>; Thu, 29 Oct 2026 11:33:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793298833; x=1793903633; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
        b=T7jeFvKNqQaMblyH7RXktRHbANi5C4ZexaBo4c/1cFGwzb9DfA5W7igf1jM2UJx6q8
         T6TjxtKeW9uewAymnAeQNJkhX+2yX8eRWzn3wVGx2QwlXzeUhKBSeRWJHUGBsARh2Yzh
         XyRpP3JUkCC/5ek4nGetpTVKKwjLj1dhrH2ZgIdsDc2+2iS1mU/g0xBnu63zQjMhhujz
         A2qFHN2eh8XvgzbMNK0/kppDWQDFn6Ykk1aSvRgDZa49wDYCmdpsj/E5uYhkGDgRGmkK
         nmmAHrVU4qyy/2/0iVMGtPnPTWmsRNbkDrQa5MvIE9EjbQBx2yDjcBWeeruvJjps+UgI
         rauA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793298833; x=1793903633;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=lDtTbVbyYNnlkmw4q3bNVv9nL5pJLpez//J97uSfoTI=;
        b=eDKo6Yv0wHiv2V+WbvtqU1WnQ70sordHLKbTZIn+lypDjDceU8YCBeTanSHywH67GN
         2+6oo/zrn1RNXANqx0k1IY/jxLohJuQkTrLPzSWW8s2cz5yECv79/xVgAkYknA/UppSD
         qFxIZ8kfz5E0a0iO2STZS4a3qQBPtHTM5QDZlX4LlgLSgpsF1+cUgfjyOBt6ldxf3orm
         cdchr+8BOFItawFg8F+K/Qs5NxOIfn5XZ1vmH623NAwETapkxyl0N7or1oNlgZiQ/W59
         6gX0XUkFgdll0SgNbYjAS61Mtj4dZ57vqVGRtrpmfZjsJe+EBQOkDF3E39zaJIqZO6eE
         UyxA==
X-Gm-Message-State: AFq9FYIQbgmKzukbTyRY0QR6pUG/V2qYqQRy9rz3NcE7TjXxICxUXTYu
	479eTArbTmVNBSko7JR/bcLzyIVyrGWCLYjQ5ouhYa0n/E4mPR6DHVrc5uO922w3p2BTyzvfC99
	/pJk6jA8aMWPoh8kMmE5t6JGG9NLc61SNRibBilg58MO0eZF+5SOfhkhynf19OT5Md9CI9QD+MI
	8N
X-Gm-Gg: AYBFou1IH/DQQO4jE6bdy6+x/VWUokofTy2dYJdfzxVP4ZqLavnuX2brODWRwediQLJ
	8duyqlMNA7J4tPx70VJMUDzUjiyw4DbbC6v6/g5L4A6nPJf9wb53AwmpR9ra555msgo3GAfwaB2
	CbbcLC6fWz0ksv2au4daQ0xwjqJOAKiCNkU2MM+15PzCbmSZRupbfAdaGxzPsr6K/u1vaga6yTZ
	NF3Eqdn8YAlF3IHyPMqA6xoJCY66eis/1vHhsQimGLTTs9EBIkFM3APydRs7uqxWQGKINR1MDej
	EHBUTaCwaQQsgyPZHA+dwXcvodu0jPmAGSStcKX80qVjzpU9F0jI49LwVFP1pa2CpCm4uUZI02c
	2v2YTD9IUCUO8/O+0MGkHfLkGxfPNy/8SEphioqoGxMJSePJrY42c1PoIxn9QCnXqXb8YD7sMca
	tx+ZMA9WYIt2UdS+UIXMObqAOII+1RkTHsficKD8AhJw==
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr216476eec.7.1793298833375;
        Thu, 29 Oct 2026 11:33:53 -0700 (PDT)
X-Received: by 2002:a05:7300:fe41:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-36a42401960mr216443eec.7.1793298832801;
        Thu, 29 Oct 2026 11:33:52 -0700 (PDT)
Received: from hu-kriskura-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a504c6sm389458eec.21.2026.10.29.11.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 11:33:52 -0700 (PDT)
From: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
Subject: [PATCH 0/6] Mark USB controllers as dma-coherent
Date: Fri, 30 Oct 2026 00:03:37 +0530
Message-Id: <20261030-usb-dma-coherent-v1-0-3147b8f7aa64@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIKR42oC/yXMQQqDMBBG4avIrDuQRCimVyldmPirIzSWjJaCe
 HdjXX6L9zZSZIHSo9oo4ysqcyqwt4ri2KYBLF0xOePu1jjPqwbu3i3HeURGWhjeGNvbpvahppJ
 9Mnr5/ZfP12Vdw4S4nB/a9wPB/jvidAAAAA==
X-Change-ID: 20261029-usb-dma-coherent-e9001f1839b3
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793298829; l=1176;
 i=krishna.kurapati@oss.qualcomm.com; s=20260707; h=from:subject:message-id;
 bh=4DZan+29ikubxEO+r+J5U3jgJ6tcstLjYAL6m7E1rmA=;
 b=RzRo8HMqpQsOenSDrTd9s7UV1CoiKsb9qVwKw2ezQD6MYoZa18+BNaI/wj73upVE2xDcEecqd
 EZh5u3bE3InBs3x9cGXUd3BlmJfOEimnBhwo1Ulr3XdXIdRO+GE6blN
X-Developer-Key: i=krishna.kurapati@oss.qualcomm.com; a=ed25519;
 pk=6PmiuwGCdov3wRO+bdmRlRxRtmJyDKz3ED57LLPVgds=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfX0RIQzlbfrpRa
 x15X1ZxWW2hHm2xRJ1FvV4czOQnFl88cU6yo4xy07BQNPqurH7oAS5d0P3KvOyax5d9E5vdQ+7+
 9GNezxbL+3d9c16cbD9+v7kfl+yGzVY=
X-Proofpoint-ORIG-GUID: PBPOIQ1TdzqcBA2UmknjFZsqYfKkOOuU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDA3MiBTYWx0ZWRfXxiP+engzoUr/
 ly4tVTAJkFXsJxxV+6974XBXj0zFxHQj88IyQovKQUuOLdXU4RP9Mxgu1REbrjlFJOn28GZKnfm
 XsMLQsG74NsLhPdSEuf8K5+ZZaeI4GXwQuuXO5DHtBVfSpAt6OoaOMGLzNGOWr6Y54zkAT47lka
 jJmQaKfQgiI/MK7abOJtlMlM0v5sGTvqSARvRcHNjDoBHqOx+gNjHl17h+QTprI17DL7ikTYz6f
 eaiEXbJSlQN3yt3+AaJsieIdcETMmkfAIh9FtLXbTlA6a4jIoV+Ae3OeobY/NMmVPcvAGMBxNlf
 fmIgYeIQlVsWmeQuRFHapp7TjiIRyR3WxOEtdQX/abYSGSXCMZjdTKTEFcRgVpV0gWISgm9zfYD
 IfP6Cy1WqDowae8UolfFm/GsrLJ1Q8APGabcHa6JD2yEAqnjdI+BCfxfyYfH3C3DwiJ11ZEwvj5
 McCy/20KPOEDjACM7/A==
X-Authority-Analysis: v=2.4 cv=CYmdd7rl c=1 sm=1 tr=0 ts=6ae39192 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=cCNIK-7_6ZKse1mBRbMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-GUID: PBPOIQ1TdzqcBA2UmknjFZsqYfKkOOuU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290072

The USB controllers on some platforms are DMA coherent but that property
is not marked in DT. Fix it up.

This series has only been compile tested.

Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
---
Krishna Kurapati (6):
      arm64: dts: qcom: sdx75: Mark USB controller as DMA coherent
      arm64: dts: qcom: lemans: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8450: Mark USB controller as DMA coherent
      arm64: dts: qcom: qdu1000: Mark USB controller as DMA coherent
      arm64: dts: qcom: kodiak: Mark USB controllers as DMA coherent
      arm64: dts: qcom: sm8350: Mark USB controllers as DMA coherent

 arch/arm64/boot/dts/qcom/kodiak.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/lemans.dtsi  | 5 +++++
 arch/arm64/boot/dts/qcom/qdu1000.dtsi | 1 +
 arch/arm64/boot/dts/qcom/sdx75.dtsi   | 1 +
 arch/arm64/boot/dts/qcom/sm8350.dtsi  | 2 ++
 arch/arm64/boot/dts/qcom/sm8450.dtsi  | 1 +
 6 files changed, 12 insertions(+)
---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261029-usb-dma-coherent-e9001f1839b3

Best regards,
--  
Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>

