Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795882221;
	b=RpNVBO9egRby+ty/ymie3LOkN1hjWq6OKFevoZbdvkNlrWFX1pvBgluUutT+h3QCIxuq
	 Pj94SYlwCEkOE5PqJkL4B+hZ6atSfBBOT2S9NmXupeRYR+LTMXzhjocfB5FD0Fuvk0EGm
	 MYtK6lXjdkkksln9c/H3BJvah1sFIySTNXDQeKaQuziscPxdHSOXSwt8Q4GYzM03N3urg
	 M4fHwWHA5GVGS57Ug1dKaTmhkgupQ4HnFbfC8AGbUYMubE4idxTJYGGLv1QZVY2g+dUEu
	 MDvPpOexWGXWlGSyk0buSDwEQwKLZSQ2nQa5UlwJfjfAOfcQm+T0BWVLf6CkKQJ1b9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795882221;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=CQ4VhcdE6arRqEIHUI74KdSfdPPk/2TMBzpKmpBXof4=;
	b=IwTgVmF26F1SpedC15xGLvrGinPjagSiQnkM4SOd4o42+17yOnQJ9RVf2Zo22RWNOKhJ
	 /mCYG8hnhi3XOTzFLvtDMg3KayuQJcif60GkO7URwWjU4CbnqJH2imFc7ks3Dq8tgFknr
	 QYdCkXW34tKii5wUoXN9cm30a1HYQl0hO+v8hUFehYTDaWxUgCw4VqR9t2zyd2kznwwZ4
	 ykp9F2bL3fKhy7Mxa7GHMx/twJNaI0eJOsn7JdkN0SZ88EpcZ9px94zBfNbfHnmWDG/L+
	 H3OlNthZLNsV4kw+CE0Hwonfp6lXb5IIXqKAuJUZN8fsLqC9bOyVkERC3hJb7FphyKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2JkTk+Q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0Wa80Tm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 954A4606A31C
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 954A4606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P2JkTk+Q;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=D0Wa80Tm
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ASAIEHP278140
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CQ4VhcdE6arRqEIHUI74KdSfdPPk/2TMBzpKmpBXof4=; b=P2JkTk+Q6NYg5hSh
	K4m0BQVoOrFcUugLmoIs1r/zUdt7OeZwonR/niG13zA/K44kn5VcxdRAkRuNNS1P
	4mGR/DbmtqVzQvnMdOInYLCRKMTAWEZJ1cE09I8R85uhvb4z6u8sncEsypmqZ+hT
	5D0IqYJGLY9mUPq1TOUBREtP/NG0IvMBWhEnoROAQZq158EEVlsrBU5tMuJanVTz
	ZcZQ4jARUeZ2UwKCUvFhYhG9t5tN3LCTieYnEyB7GlUBeveccb9UyoOQkWHy7dvT
	eIa+veyM7HN+Wu79Q/09x/XOq0Rxry+/RuOMlN/7cWv2AyEwzOh/p4thiDJYX8TZ
	PdKb/A==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j7qb79769-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 16:10:19 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b3b45597c7so1037978c88.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 28 Nov 2026 08:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795882218; x=1796487018; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQ4VhcdE6arRqEIHUI74KdSfdPPk/2TMBzpKmpBXof4=;
        b=D0Wa80TmIqD7jDqXw9NMudAHqthWfdqry+DdBgHGeg9eNvWrNJQ0F33zP/kVHVE/lb
         LLt0xD/lzKQnYLOiZpWF9/W8OAPSFbcrm4O8RxO2ks8Oojr7BWfh4fBTFfQCsnhpfc5x
         YSOHteeyvIMGS3WpqiJa2o1vr4wQ7K+6JOOw42GIoKzuMUU3SEPVFQ845RbXjmtOM8ie
         F4GgnpD3LZLdn7wFgzxYLvamCABV38pd6/+0/Fq15pM/VrKl+v3sd1hrKpJ5OuywwMcc
         fNY47iDkWmF55xqtNZ0e9VN3TkLtE5NlMUSYAkMNB96vO58jACd/3r3JGKrWFthM4a5m
         xmhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795882218; x=1796487018;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQ4VhcdE6arRqEIHUI74KdSfdPPk/2TMBzpKmpBXof4=;
        b=0OD2uHtdbFZ/qXOHTlUILBEGG5aKyUAnxfHvSUL8uB7XfVf3P1QnwvvT1TQHu45DVV
         8Mnjlq0rzwjLW9WxFAfU+ZrUBQjTbMJxv7lx5wQhjIIKvK4eltrE3BwM9SVEmhxMYmHO
         tEgHgKZSmEdWxnWoc2VHu0zPQcKVMM0IE8SxE8l6khlKlUVcmeTp2dbfEMziMKg25OqM
         TpO+j9iXE6v2Smx+echriifhnRxGwUdONDchDlXuHXjipf7QvYNDqq6Xz/JjCcNj12Te
         pnFBun8polrQC+9H1gAmVAmhZHJ6OTB5BTn1CvDMRwm5Vl1oFHhxl8SKZbv63LKmT9E9
         U30Q==
X-Gm-Message-State: APuU4Z9jaNRK/pexXA5l9NG5lWUxMue6EF0LyboAeKqnoRPfYyxLjuoH
	kxvL+mhXzYYMRSBeg+MGo0KIOg2XPxtYpjGxwflZOQ3WrkzYaHscANnT+2pGmQQBeywccNQSU54
	pTO8/SgOkCLSvZzSNG8W5kDivUs+CFWEk6T1Tz6BOe2haAxYuG6Ac+09QCgtjX7DQD/X4
X-Gm-Gg: AZFdTZfYT/rIsb1ABgqHB6Xf2mjUf6GopZK1S/r2CeMQvKAsYlnrg4mCw2LBvGBCXZV
	8oPrQqjTFGB2G+rfipvzWqENyb2RMK/yYGn2n7sI8UXukAGuu46yZyDF7dzs96h64xrv05uc8S+
	jRQa0JYrFb/3sX60d4VquI+fCQei3X8eGMsZPBSbyNsTD9wuiwJwG5oqNmAswCSS77YELrW7cNg
	EPCFGA4+Yneo6MmupC9m+5YIzhua/izzz3wH4iJl4s46ri1SAG+Njf9JmwElEZiJSdhJctQNjMH
	Whn3dQPat/CgufWrpBKPS7vEIh3lRtuuoOVYq3m20OZbXG4dqA6p39NIUbNLlpHLw1FMtwdFHDk
	dZfji0F7jVHALR6Gts2Y+CsKimdCtJgczPffnYFyknyHj7HX4+Zp6qrGW2xtO1Ljwk1HkomRis1
	xPDdmnrVrLDw==
X-Received: by 2002:a05:7022:ea8b:b0:1ab:fe29:5081 with SMTP id a92af1059eb24-1b5568a8a15mr27593743c88.20.1795882218276;
        Sat, 28 Nov 2026 08:10:18 -0800 (PST)
X-Received: by 2002:a05:7022:ea8b:b0:1ab:fe29:5081 with SMTP id a92af1059eb24-1b5568a8a15mr27593725c88.20.1795882217738;
        Sat, 28 Nov 2026 08:10:17 -0800 (PST)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55684c85fsm98647481c88.14.2026.11.28.08.10.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 08:10:17 -0800 (PST)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Sat, 28 Nov 2026 21:40:04 +0530
Subject: [PATCH 2/2] soc: qcom: aoss: bound the cooling devices to the
 binding
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
Message-Id: <20261128-b4-aoss_cooling_upstream-v1-2-55c1b0578582@oss.qualcomm.com>
References: <20261128-b4-aoss_cooling_upstream-v1-0-55c1b0578582@oss.qualcomm.com>
In-Reply-To: <20261128-b4-aoss_cooling_upstream-v1-0-55c1b0578582@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>,
        Thara Gopinath <thara.gopinath@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Proofpoint-ORIG-GUID: no0SoIdBe9GvymY8ya8HDkobAGdXJZDW
X-Proofpoint-GUID: no0SoIdBe9GvymY8ya8HDkobAGdXJZDW
X-Authority-Analysis: v=2.4 cv=VaBir1p9 c=1 sm=1 tr=0 ts=6b0afceb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=_5cCeYdfwWRxwekHKasA:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI4MDA2NCBTYWx0ZWRfXx842ARc9Jjv3
 aBukf5MHe9FOSLdl1XedBJiDCo+622fRmPSIXcX56tpcWpf7PEs0455kwlMM80GtLT5rFuR2Mfl
 V2TwO360Gf5w9CSyC7Yf/TxSuCHNeWw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI4MDA2NCBTYWx0ZWRfX4HtX3MNTGvx3
 AlW5mePkFH5UqtB+ufGMdr7eCJoQ1+8pUc5fOx/PEqAw5N7VdHYx2kt1iyQbgWwaztkuNv5rLUG
 pW/nnvzMb5lM/Ty0LJ1S8BCd/3+TBTQfxyYIBfem6aaKfbrp/R8WckLmy6ZgbjdkUGiDXiu0GBr
 Z1RgEfp22BOFd0HtUBjoe7KMg7gqa8LdbmsiDp3OG5Jpu2TC1mYpEGfqDhJjxdE0ODux7esnwS8
 4UCUOivk6C0KLEJTdwfToWfsxjiLBCa+mX51hZKMBjujFX4WL6ySzfFa5PJqw/B2aDhjKKa6kFc
 SVVVbm4BY25/iYSl+dyTJKrVVvpDXn7fkrSvYuAMSWYQ8xf3fnWJPuvyfwOUxueDiI1BjWUcQzj
 1zorhTKw9xXjGwzTJIPyru9d3HtxVUz3B/+h+WBf6261DOUIgkWnXoYuQqf7e8f7yeobtzZczrd
 Mi8sNNGDOJnZk2nNedA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-28_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 bulkscore=0 phishscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611280064

The qcom,aoss-qmp binding describes three cooling devices, cx, mx and
ebi, but the driver allocates space for two. The registration loop
stores one entry for each child that has #cooling-cells, so a device
tree with all three children writes past the end of qmp->cooling_devs.

Size the array for three entries, and stop the loop with a warning if a
device tree has more children than the binding allows. No in-tree device
tree has all three children today, so this is latent, but the binding
permits it.

Fixes: 05589b30b21a ("soc: qcom: Extend AOSS QMP driver to support resources that are used to wake up the SoC.")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/soc/qcom/qcom_aoss.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/qcom_aoss.c b/drivers/soc/qcom/qcom_aoss.c
index 44b0c457e4ac..6bffbf4c64c2 100644
--- a/drivers/soc/qcom/qcom_aoss.c
+++ b/drivers/soc/qcom/qcom_aoss.c
@@ -47,7 +47,7 @@
 /* 64 bytes is enough to store the requests and provides padding to 4 bytes */
 #define QMP_MSG_LEN			64
 
-#define QMP_NUM_COOLING_RESOURCES	2
+#define QMP_NUM_COOLING_RESOURCES	3	/* cx, mx, ebi */
 
 #define QMP_DEBUGFS_FILES		4
 
@@ -410,6 +410,11 @@ static int qmp_cooling_devices_register(struct qmp *qmp)
 	for_each_available_child_of_node_scoped(np, child) {
 		if (!of_property_present(child, "#cooling-cells"))
 			continue;
+		if (count >= QMP_NUM_COOLING_RESOURCES) {
+			dev_warn(qmp->dev, "ignoring extra cooling device %pOFn\n",
+				 child);
+			break;
+		}
 		ret = qmp_cooling_device_add(qmp, &qmp->cooling_devs[count++],
 					     child);
 		if (ret)

-- 
2.43.0

