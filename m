Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BFFB4248B7
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784889571; cv=none; b=FtDcCR8g1MHDFfUCOjuwg5eDrsomj2d68Lli2hUiMpYeVZkCGg8MVnuffR4/AYRm62yuAk+zxpaa3Gyaa2jFhMPTii816CLigDvGVAGAQCH6rWnYoJqqg3+2KSMqvP40zfQywkDWanRkXXeCOCGv/GWIlQeN+986gKogsarydVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784889571; c=relaxed/simple;
	bh=hIzDAOSQ7K838svGBBJ9JCf98cNZaQNoCPCfM0iswxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ebwjcBSDP7IJurDTZKNZ1ohon5ZqwXrW0x6X1Z8GvBSSEoLSp/eVGvewVCRSSWNcgMlrO8Jtlj62OeUH/4sKN1b0Jw38oPWxCYmSU/EPlfz95AhFB0GloYkMveBErahNoZMhwAGahdXXeBxBDmhqrwuBfwvpcsKL5ge3acbosLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faw/uyNl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YZH7eFoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faw/uyNl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YZH7eFoR"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66OAE0gN2917067
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRol
	KDqfOfCg=; b=faw/uyNlvL4vwvTBqFW/8y1jnsrOOeBp8pMgAIfZueDX9M0XZIN
	YMeg4pHJAGvSZTMJYawI6uvhR72l7yaFXJ12dCRgWjbHkFurZnNFGHOH0ADj/mgT
	e+L6IeXxiiNpOX3j2hpoJiUgbTJJqyN3TXH/4ftWCbH3NPi/LC41usfI19tzLsqq
	N48O0iSiuGZohuxw7VqtMH7awE5kpg1n6UcjvNQ+9tkVRari1Ouo3CMX56QCQ4si
	dc3cYks0HAdWAl+YkL/h7/fyBgZDyK8jyE13snTjTobdAYdcS5tc82hmOYYzLRCL
	IBxYS+x1+bzR6K+1fkLsWWqP6XwzKBJyPww==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkp5vksdh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 10:39:24 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca8aee88725so500596a12.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 24 Jul 2026 03:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784889563; x=1785494363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRolKDqfOfCg=;
        b=YZH7eFoRSqBaJQHWipQeCEkvURZW5q+zfDStIsV4w1as2anUjvZZNGqxBG7rWe8I6X
         h9IBjxjqcfdhamjY1+2aOJUK2RkZMkhVtarjbQ+kOJrc38Aqlu6HKfVt2B1MXpWlP9ja
         94I3bGWjocWvIAJDL6D9oqMNzZgOQTFiUlhNGV74qoI/kmr4FjM+3GF2ToynsDWn738o
         G9gm6iQ8mgl31erWtslCkoVlgfw0KMAnkVpYxxcMNzIlM3ub4McSmP4vlSDcwLvPeUiu
         DiLvDDmrYZLTqk60xwtEkNxJaT61J0pQu11PL1b4yA6BU1ZoemMk9eH4sCCjvDL4hjmh
         ozwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784889563; x=1785494363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h6cnqFci2JIxJz7KmTSqiWOSZITGQx+tRolKDqfOfCg=;
        b=aUAsqRfkTTOUDYNS37bJBUS0TJnPDae7fJEelfPPGWRb9QKIrG/4VUwnw+puf1MTSi
         IrJ8QgQ7L585c5V1eh5o5YARxdoJt5GZl7VK3Vibru43BaM8TMxLfDEiYoUwIMs+PJGA
         cV9Z06S+HHppls1MuowHC0Ts0rAHqDhh7NqWhdpneutEBKNj8h8i3AdHscQhfB+UXMFR
         OcvwvLjKtnhWsnL3/gVwkHm8ReAOJDuPLF/F1aRohukGNeA5Cp7q5IqsxO2lqcjYVHeG
         5Exf6a86yrBdYsDXd+pOx50Iv1yzoiVbKrp6PtWdquWHwvl6la/PK9wF2I53yZKEKOCI
         7K6g==
X-Forwarded-Encrypted: i=1; AHgh+RrV6OMpT8S2HPt655sDRrhJQH3SrNnc9VcUGWB56HbnGHZ2TyfOXBVXJ3q73iqR8w11v4WFQBZUugSmM5Sa@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm/7xNQDHUqcwR+q68vkQDYQhUQWtU/oHLmVeR0aVLNF005gxy
	HdDdnigL6vJlAe8TeKWxop5uhOxwCUkpz+JqEDFmDF4viztTv62WHKbN/lK9ba9X5j0eIU90Zep
	qBtz/0wbIGT0Gl1vO1yCJZEM11MV6DWIKsBbH62AwMC/91g1HeSeAGZTvc1rkb9Wm9crn
X-Gm-Gg: AR+sD10dvidJfc4JdjBSV35t/UIXGqvNITkowOz1kZ9O7yUOIC58GP4bwOJ8BS+FXN0
	bnJmDnTBhU5lm4NzflI1BblvCiYDThybOaaJxgIsuK65KkJkeSwn71aHVlQ4mwpruy1hmETWXk8
	4opAUFa5AVUOtPw/6E05N0FuXJ32Yeo1H3T3tR/qHv609RB9wbDPbdkZnSwlKdnPwyqwgqneP8O
	EbNQPkYeFfHIPo42lpN7uq5MA+6MkYIhe4wPNHjlH0IvKopjTdOyiY6I7HXfEgP4VsAAfGS91h7
	Dg8+nMuUaS5IAvLuZQ7I9ENNGypest6+URSHRHKlLpRWHjkqM2LKC1/7UdoAluY0s6V+2FRHzzR
	iNmAhKyGbIRNjQEqiUlYsuH0qjvXESGd7ax+96/E5rDadRPdPb67L/P2WHDYk
X-Received: by 2002:a05:6a21:391:b0:3c4:34db:9fbb with SMTP id adf61e73a8af0-3c44b21d7b5mr7507756637.57.1784889563500;
        Fri, 24 Jul 2026 03:39:23 -0700 (PDT)
X-Received: by 2002:a05:6a21:391:b0:3c4:34db:9fbb with SMTP id adf61e73a8af0-3c44b21d7b5mr7507707637.57.1784889562765;
        Fri, 24 Jul 2026 03:39:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130262d2sm22495290c88.7.2026.07.24.03.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 03:39:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2 0/3] Add ADSP and CDSP support for Nord SoC
Date: Fri, 24 Jul 2026 18:38:45 +0800
Message-ID: <20260724103848.233804-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX9UrVoITMFP4o
 jqrw0Zvcwj6GUljhYfCXcV6sStJv9xciJCaGxnoto+BpP9gYFtM+UnWSn21w1200vNNmMorWe4S
 1jJxOYd1gT4+rZdsSCWvu8tPvoAWwBU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA5NiBTYWx0ZWRfX6mdyuGA80bKt
 EQgHkTcGcWW8lKaYgbe+HdC/mrCdGHXWhmY+d8suJfiJ30PqPdAWVBK+mRcOA1rvYdroB2mHZ8m
 z2PDdu5heu78N6J2KYbfHlNqUBuvc3BNiMBIH0PqyDQjHdiU5Hq2zYZAyz8BEJL0Q+IbQd2bZzz
 nGbqB11u4WxuJXWirQuUVlKegcCaW/CqJm2RGc7Jo6rqnzdSr5i0c5O1k+h5eYu+NySnze4u295
 bCFEu3ezPaRiLIrDQ3LCD8+1UqFk1x0zBHwdSIL5EK5PzmJ03yCp0BBiC6IipU2+VKDPo8su+mW
 Hz+txBXTvoUHbihACy4yViv4zYqjPrIp+YCKAM+gSQJNU/AQyrnW2AROrckzD2vXcHfukteQZUu
 niwKzqM5AOoo7dE0lwQZxYbYvRi0+p+rbjUXoHdZ0L3uPqVFchuzzvu14bjgABCOKxhikRTuJmd
 vtcQ7zFwlkrWFm/EOgQ==
X-Authority-Analysis: v=2.4 cv=Z9Dc2nRA c=1 sm=1 tr=0 ts=6a6340dc cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=YTZeY_j4NDz4IKi_2jwA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: JjfyxLCthVcDj8-0qc7LZ2hw4FMw5dvi
X-Proofpoint-ORIG-GUID: JjfyxLCthVcDj8-0qc7LZ2hw4FMw5dvi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_02,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607240096

The series documents AOSS side channel, adds ADSP (HPASS DSP) and
4 CDSPs support for Nord SoC.

Nord SoC actually have 3 ADSPs. This series only enables ADSP0 which
can work independently. The rest two instances have dependencies on
ADSP0 regarding start/stop and SSR. And remoteproc framework doesn't
seem to support such "slave" instances yet.

Changes for v2:
- Create a new qcom,nord-pas.yaml to cover Nord ADSP and CDSP
- Include CDSPs support into the series
- Link to v1: https://lore.kernel.org/all/20260709085149.4072181-1-shengchao.guo@oss.qualcomm.com/


Shawn Guo (3):
  dt-bindings: soc: qcom,aoss-qmp: Document Nord AOSS side channel
  dt-bindings: remoteproc: qcom,nord-pas: Document Nord PAS
  remoteproc: qcom: pas: Add Nord ADSP and CDSP support

 .../bindings/remoteproc/qcom,nord-pas.yaml    | 167 ++++++++++++++++++
 .../bindings/soc/qcom/qcom,aoss-qmp.yaml      |   1 +
 drivers/remoteproc/qcom_q6v5_pas.c            | 110 ++++++++++++
 3 files changed, 278 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/qcom,nord-pas.yaml

-- 
2.43.0

