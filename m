Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80F4043A7FA
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789382716; cv=none; b=ouBxwB5p475HhDojANfyTR3ET9PKvkA0/MMc+aLGc+DCUgWX2Q/x9PX4RXvsorTj08ebPwGmQuDXKOLQfjekQQ+5o0VmI/HIX8mVf05QZrPP/XPk+eNhbDaPpZ4mF1LWoJ4LQ/phjQTT53A7Ur2SaKFHn/eSrNuEpJ8ciLFA4i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789382716; c=relaxed/simple;
	bh=VblMUtasfF6RjPCwMXNJ66KxCQ5fC4RR8B1FbYJAMec=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IKuz+pWMdE5lLovkQgQvFM2bZqs81cxNREPanBeINCWDKw+N4XMqcwqQYVM0wcngEfkzwiH7M3gsqWqYIUOgTvx79gL9J05W7tRIm7yyxqQnn/jfrkx38SIKFnQaW8KPTzEYJWZJWSPQuJlSs0MWoD7lOjtT3zQ/7bN3EW+LbQc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hTCY3NoR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkfKX1fh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hTCY3NoR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkfKX1fh"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E9ndsT184559
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=; b=hTCY3NoRxxVkl66c
	IXm8m7gpB4mR4T5eNRASpEebuV6jE7bzW8UWTTwlTPgJv/9KL9X2MqLzarXM9k9w
	m/6l428Uvuo+FqaEIiYfJiNl0h+cDaBob8tQC31bDRWI2FJ4X5eFl0LVVde6EN8Z
	ONeqLGiUaM8wj2mQ6wjBm0deUcQtasuXe1L4Zp3/01bY3trQffsuzEZTSKRdHYQA
	pjoE1J4ZXWxqoKU31UohsWmlhO7CuWxNQ2kLo4zIfLZPA3Th8Vfjj6MjtsDLMde4
	jrd0eBVuqF9v7fR52m2BKiUpbEkasdKYWMnRQmEgAHrkBwyzj2C+NMrs5VsON4ck
	F2rJkA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9c66rs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 10:45:08 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-939d6c515deso626912185a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 14 Sep 2026 03:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789382708; x=1789987508; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=;
        b=NkfKX1fhGejU7UKmGWwtU6j0zZlr6rVv9shKXQgMZNNLvQeYwSrkNmvwrbo8QBcwHB
         YuC3psT0NF0bC9VgZl4ZiHSjrkO7xdeiYaaS/CuTeV105GLfghN0qbM0ZhSWsgXSJu6j
         UugO0vpDNbR1VDLs4bWzIucXa7fNtEd1KA17L4qQx/LgS1IjqA2SQ5huIwVUEHX8lFd0
         OPhfFavUo4foyU3ymjk+Opeu7VbROar+835m+2DPRCwzDRSuOQ/UUpRHFJ7+CNakpO5+
         Le9qwfkuCdtEqxnhJ4lJ8B3iBvUO7o18Kj1F319e+FAiRzHsRD5sFrRJ250u/ZtGdpe+
         sVaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789382708; x=1789987508;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EZDQ+7buSGCLpRXUFmxadkYINuEGI1foNY+nX0ZiavM=;
        b=rBASWuM86b64unM85ZmQAtPdZnd7pyeRjgFGFX1GdJfMUvSo+xDrRj8ooZvBPAbDvH
         JPQZ0HJO0URFanrxPdNUxh0vg+p+y2WxEm4Dp9YoF869+b3kht+LueP7w55qoagay6Vr
         Kv4T+Mz9MooMAeUhT7SHdsGQecao/dYgRk/YgCNZB1uCpIKzz/0E0bVPRVT1FwXJH/67
         vQgQG2Y1IskUK7Nu1hDGFaV4yhUe5f4hJrbp4r5r3ZIkPR11Y1jX+SZVrloWXUwuY8dl
         OrB/syyj9x/C3qtY9xNx9G9YrNnUzwTrGAxPXIj5c6vhYasjlYqEw/cLKdCI2tJvPHia
         AOQA==
X-Gm-Message-State: AFuF++nECSIMwODy5DD+lCyCCzG4dSDvBTQTQ8v3rTtRX1psj0fdrKYQ
	ey5PYt0BpXyd0AQDTC7Hr+j0tdqU5pM4r1ymCChfK//hD+U59qTny7FlFYMMZD+ti42G3cHZVQr
	mB9J8nMeoRGt48IHQwZCsvMCwseyX6nBGdRazgqZuIzQYFbuc0x1TYlB5Y9YWfjp1AUCh
X-Gm-Gg: AYBFou0Qw1E9b+h16wME8K6TQZeI+Z3mIA48XoVpR3uR5L7fiXOTiqBr/O9EM0RAa5W
	X8uoLB+OBtY8nXPnj/PSh9XKau6DLjiFmZj5LCmrCkWRzEUJIXsq2dbu4Dy13eU8pleqIhrudSC
	qydTmX/bwtWCZHu630vtQi5MCxU5ZC+JOLNTUdabGt2naIEPz6t4mghgEbShowLl71+rbTtVJ2Y
	EC+MIE4IjASfx2+Zw4XDXXIya8j9Qlb3bm2eHZdxXNlwSCa/z8QHev51NblZcKyxSiOAMoj2Ibn
	MhZEFbHSsygY6YrsyeXK2KKYbDarFgXIkS0oSed2eZvV8OypXE3Ry6IHVvis9ZJZ+++sBbNWauz
	SmiWeE1X1
X-Received: by 2002:a05:620a:640b:b0:939:34c6:a333 with SMTP id af79cd13be357-93a29b98060mr262803285a.40.1789382708115;
        Mon, 14 Sep 2026 03:45:08 -0700 (PDT)
X-Received: by 2002:a05:620a:640b:b0:939:34c6:a333 with SMTP id af79cd13be357-93a29b98060mr262796585a.40.1789382707562;
        Mon, 14 Sep 2026 03:45:07 -0700 (PDT)
Received: from [127.0.1.1] ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb33ee8bsm26335926f8f.15.2026.09.14.03.45.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 03:45:06 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 13:44:48 +0300
Subject: [PATCH 1/5] dt-bindings: arm: qcom: Add more compatible for Eliza
 EVKs and SoMs
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-dts-qcom-eliza-add-ufs-variant-v1-1-78b3249eae61@oss.qualcomm.com>
References: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
In-Reply-To: <20260914-dts-qcom-eliza-add-ufs-variant-v1-0-78b3249eae61@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-0e65f
X-Developer-Signature: v=1; a=openpgp-sha256; l=1384;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VblMUtasfF6RjPCwMXNJ66KxCQ5fC4RR8B1FbYJAMec=;
 b=owEBbAKT/ZANAwAKARtfRMkAlRVWAcsmYgBqp9Aqs5iHvG2s84MOEmhkMvVd4hCbHTdX/Q5Tm
 3FfsjY4N5CJAjIEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCaqfQKgAKCRAbX0TJAJUV
 VmDFD/jdG9jdHPRnideqfQTJhabo3ZvtckWih8iUlO6kI0euZqW76D0PNH2AM8MK0xsokbyok2H
 8ZWSMcxsgRiwgV8MMXIyP4WXFXRE9hCCwkDbfWHMZ15/6MkfZU5aB1cySIGvdOABuTxeHpTwJrr
 dpuV4hIER4Wfqt9rvttfWtGI4szY2MA+vr6GgIgDcxuT8R5jSEL5z7IyTzyi95BbwumPEbTfMNA
 1d6KF4xYtG936nJLeGGBeuAONHt7dTgOOcA62oP8Kz7odv5cVLxt34iCsZnq7nIVzG9bnXW6mcb
 t8h/RYkOC7IqpoJT8HwzrHfRBytpcGkfbKLzuullbvAGe4nlp+G1RhaqFH0f5AXSg4jLHdYzWsd
 02sllhq9VawQCACqEpWwGqFMre/Mi+CI1jzB59ByTYWLWLpQtM79L4SHJmNaNji/MpkGgFt1aY8
 O2U1+qbsd6h4qxc3isw27jLD7JVUWk0Aw/5XpoHWIR+MwzU2jtzmdqxxvpRoM43frIMjYK1d4/t
 9SI7WrDbUnfeUTkbSgBqzvnjamgrjzpIBg138eXU8LSnfa8IabWCeENy5chIEQ0PFVU7FQyS0Ms
 weOoWiS1Yyq71TqihsAEd1y8Bkx8OA8vali3nTgcpnDi/3BZE+Ts5o2KtpDGK/kTFGp+1cHUXEt
 h3Wea9D9zOQOX
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: iEULZDnAp7TeXe_DwJ4QHR7ofinwdpsW
X-Proofpoint-GUID: iEULZDnAp7TeXe_DwJ4QHR7ofinwdpsW
X-Authority-Analysis: v=2.4 cv=c5Y+0h9l c=1 sm=1 tr=0 ts=6aa7d034 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=l6ELImiZ1_B-ckXs1ZMA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfX4lwaWDxv3TbE
 rzPLjIJq1KK3E3JgRl0EZMJWVFUQtYR0KES7qs5O33ZaHsqL+iCf6AursTY2hrTy1Ca0q2ABaJk
 jpXvpLKAlJj4r/PTYW8b2Z2CS2ZGyTJ61y8v7Vwl9Guq9pymR89bylqmo4P0taci0M13qMez0O3
 U5p/7DdX2ybkxMrRwUmjepmT/62hDLuE57sYDINBn9H97GWCsXW403penZ6krRXdsU27L5y5x7d
 kLqRey+ETBprB7FOoCMNq7pgHJkJdK3SmfOX2ES2Jtp1c/q5IrfYvAiy/5uvEL9hGV4Mq9aqcPx
 H+KQ9+jVz6pV7NK5hInoK9NcKxV7nGr+peHSfrN7//YhHrUzoIBE73nBTVPMSNRgI8gkTrGM1d9
 CiaCoYufRlJ+rukencNfA5RjWryTP/qpMZfDGj9uxy0aFqm8MZ8uYrnCHJ75eUhLBqEjK/O043z
 KsUlmr2mYTEoBxyHqXQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE1NCBTYWx0ZWRfXyaGuKxN92BTO
 ejOJ3YzQVE8hqTmJQa2F6boBupXgJAYNgVHxUJptuhHJeOyoZdMT3Y+wmGpIUcLd9g8mRDfWjp+
 /dTtzbXlJrjJniKovPaphSn7g4B+1n0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140154

There are currently two different Eliza CQS SoMs. One comes with eMMC
and the other with UFS. So the Eliza CQS EVK can be connected to each
one of these SoMs.

So document the eMMC and UFS compatibles for each type of board and SoM.

Neither the CQS SoMs nor their corresponding EVKs have been made publicly
available. Therefore, replacing the generic compatible strings with
storage-specific ones does not affect any user.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index eddf87fbd0cc..1dd187e92b68 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -56,7 +56,16 @@ properties:
           - const: qcom,apq8084
 
       - items:
+          - const: qcom,eliza-cqs-evk-emmc
           - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-emmc
+          - const: qcom,eliza-cqs-som
+          - const: qcom,eliza
+
+      - items:
+          - const: qcom,eliza-cqs-evk-ufs
+          - const: qcom,eliza-cqs-evk
+          - const: qcom,eliza-cqs-som-ufs
           - const: qcom,eliza-cqs-som
           - const: qcom,eliza
 

-- 
2.54.0

