Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771623;
	b=L84b1+vKEDhcB0HiY8Ge6qepYQH8fIkluv4fwszfw/EZlBL4NM9I4SQnwZfzGLAascRN
	 82rkbzezpSvi7UVXPa3V8OWjyegGMt1Lkx4jduuUwXzGB0yz6WTtAZWbYdwFLhux94mwc
	 pQBGi/OeL3nk6tfI9PfS4tNwi1W9LaToCQSYZoJoRkHCOxdi+T8EAsjh5csIjPe+bWZlN
	 RzSTWCvKa5Ynm1PuasWgolA9WUqD5h8dYOArzEVQbr93qE5uN5e4niOTAUtj70NpnnzeE
	 CMNU7PiAeIbnr0xS9SDNez6K+QW+EnHXgHFQDUUZpzGge0IIV0fpLhuXhDKxZ2JPw8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771623;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9VWAUDePA=;
	b=u80rsx7rVIKO7Eb1xqM8PGF3bIluRsPiS5CJBO/IdfPcnTz9A2p+LSUCb3tyEr0DNFeA
	 trpKObiDWjF/V182X/2uYgfkEUOEomWZT63Y6ee2rBLyokC8phTabAgI5dhjbxpzEj9Hm
	 1IoxUQzuMQK+8wjiZTkV+GX/ry94NPWlE/fKo+MubmtpXcZRxmx+z8/53jgBDkjpAaZEt
	 sA/lQedCYqIrwCvZbQt5qVqqbZPTnma9vU4B2tI/lFcUD310WDkY2NrpjioEdSDDAVU55
	 JAysdrNOqHVuW/9IoHxvlSG1mc1c1dITgfydazs3MQ3/CduAkwUAb9zqPmD53zk8YzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T8zpJfpN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxXWRO7J;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 083CC606A68E
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 083CC606A68E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T8zpJfpN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RxXWRO7J
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR7I1Xx3118313
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:27:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9
	VWAUDePA=; b=T8zpJfpNH86tsUX9NIQRPoFRQLKjYlPx+9fRvOHs+3s7loj72+N
	5Vsepw7yQJ141cc2i40vJGJqkExf+YJzxaM4uhNy414XmlBxToj0vUGpMf+KaEyD
	Pal5u7OpmjhCl63GrzBHV22nJmX8g9U7qNLpO0zhie+JScv+h+0Kn8XjwTcZXFCe
	OGaJbNv+3YE0ahA/iqwb8MZ55demfXz3VoYsT5IR/4lFs/l7eECrGIJTC2W12L9q
	ZMfIMHCaIoPxWqYg94nFv6qdWfm6PsRi+SS8Xj7308wfwemCr/qv6ke1iPJo4tO9
	3UUU6jSacH9kPUe6m6Ro0/6+XNhtCHZGyAg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j73dh8wxs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 09:27:01 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386177b0516so19779822eec.1
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 01:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795771621; x=1796376421; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9VWAUDePA=;
        b=RxXWRO7J5fQe3CLoP09Lqw00KW+cscvW7Pziz6zrn6ZMIjyYvBV8vdTiBxl/x/Oy49
         R0zAN03hcVb5R3/Kq9eZ/jmWuavMVZ5r7mLq2/VLdybI5cv65KV3laXu4YhBowdf0CZE
         ESq6rjGvRox0COsqPLw5WSNtYA2rTJWhQnvN3X4zNPP65QnB6QgTf90oxjuEHB7vofOS
         ezID+M5r8oj4F/UvVW5cO/oVsSP1PX+aWds3Sr/QKkvtBBZMajuTfU+xE1a9TbJOOdF3
         A5ZbsPV3Qrdw6/V4n8Gq88cBxU3wG7TLwcLsef9xpALXssqZMASVd3IDWwYWaQZOVZZz
         5E6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795771621; x=1796376421;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UorbrerDInQFylcLLgPkKNVJvYXLBLALd/9VWAUDePA=;
        b=apDE6rq/KXbmeik85V4LIOyoGqv/cFE5NfSD+XjOqXsDKYekS0zjlSVs7Cplm23Xql
         oPwodf6rsHKC/X9HbtsJvq5KSRzPwC+MkAgT10A7PKFKVTLNjJOc2bRIQtBVXZ3iKFhF
         86DFkj/PAUq1l3wM6sofO39Hdvoaj6eY+RglydY+Q9xPAzs7dBIXavYSqgv2BWW6JORf
         /WUqSFSolwkJyWtUgC0I7AjfhRqRSrFn99CicGSLxxsx3xVs1cdRhXW2fNsizjnYSN7R
         0SJFG0g1SO0JDJkfJsBVJGbQ17qADc7c09stKuSVCxueXE32j9Kqj/4u+RDTiH70QHD/
         G3OA==
X-Forwarded-Encrypted: i=1; AL+hErG9ySrRqjPgNRws/xyf43O7lqhCk8wp6Y4/KAeMfGVU8L1ESOn8NmQedSscBSbAfe3JGUY+gJjVRDUfYOF9@vger.kernel.org
X-Gm-Message-State: APuU4Z91MwQl5QrG96gATxsF4gDakrBQRF3dHouAbTr0szLvOaE9RVx0
	Z6cs0WRCKXNfR7X5ePxTDBSsK23xnxZPKHUqzYnv8/qynUUOnFm+cUfWIWzhI2w8BKJAWFkMCdK
	aFvKZNT/dws5UN6XJhoZXaD42o9I4fymL8pyh4nRVisI5Fw/njO9Yz8CQNRKcqhR3vrjX
X-Gm-Gg: AZFdTZfDZyPKhB9z5WtBT/+1EwtfMT0lEmZkkuyw2t3lH5TBrwYHqfk39nf7yCLlswx
	KVhZEsV/E2BWjfmWfo1WP7Afi4N6z0/W/FKpTVHYYonke66eeOhG954LPE1qP51p3rSTJ1VfF7c
	3haNsbOJ4TiMWkKDH8G3LhD9/+6Yh/FcbKNb3HjnHBCc5VxFXaluNw2nM/2WRk5NX4UBvQf+op7
	CKrRsoI40k6ie7BCYeS9puZ9VqX97y+/Icb6gVkT5vLtH7mYJV8uEKwFiyz9g25XTcQ9fWVrQqQ
	Ta75xa1x4fTGtkZqmGb2W2Nl3SqfhsVBla6PNX1hrVip4uJFGvyhyNn8OWv2bHqqz90V/fVQUFS
	a46tzAbbqCynzaS4I+c+MrgJRaN4vecCflxwqsZeGtfujBvkZJpdS4TNjWTi4Yxf+8AdZuLEQpZ
	wA/5JHDDQA8MnGqn453NWi630M/sOzxFrBbE29UA==
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr30315243eec.4.1795771620734;
        Fri, 27 Nov 2026 01:27:00 -0800 (PST)
X-Received: by 2002:a05:7300:108:b0:375:50d9:474e with SMTP id 5a478bee46e88-3856c0d0bb4mr30315215eec.4.1795771620194;
        Fri, 27 Nov 2026 01:27:00 -0800 (PST)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c371esm70192186eec.23.2026.11.27.01.26.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 01:26:59 -0800 (PST)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
To: andersson@kernel.org, mathieu.poirier@linaro.org,
        konrad.dybcio@oss.qualcomm.com, abelvesa@kernel.org
Cc: quic_clew@quicinc.com, quic_rmaina@quicinc.com, konradybcio@kernel.org,
        sibi.sankar@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Subject: [PATCH] remoteproc: qcom_q6v5_pas: Don't mask shutdown error with SMEM lock bust
Date: Fri, 27 Nov 2026 01:26:56 -0800
Message-Id: <20261127092656.2064915-1-gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfXz6kO0GS435Fh
 iq5o7uXUJJnkTrp5NGsAQvrj2ZzwfvC8rbWcKBKNPkpD9P5Yr3GmEeyw3yBlx+z5nK/YCc34UXY
 0I/kLGaA4Np155xRQ+hSB0k00K89GBvSQZVjToVZ1z2chwW4hxPf1oRgVA2ATJ7koZaoh6tVUq5
 OjWHF1VPcqR/w8B4w+EqW1Oty9gqtPKtkj4uTKBVbEQse3wwGlGp+OCsK72G2CkHc0qhKTEqKOo
 mIq1wBz/nLgcDAuC1T2AV7wZHwxjUoCddmjhnpkf1a2Qp5N9AmYsLMM/GAs0qU4fJe1OMHLQBJp
 5W+liYhLrQR7sumM0N8w+oAu++fbgc85zyt/hIlDp9KdmgVx1Yr/PuLjKYBFu+9FGN0g/vRSbdJ
 3L8UTD58tjAcLmHmvYnaEJZfWwvlFxBOWXwzKQ6bW2TmOWNy+Nq23tBDwtzqjLfolWhuDf3efAE
 3t2mq4XTSL+TbZU6PGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAzNyBTYWx0ZWRfX/liQZEh8j6JM
 ZZBJNVn6CDQbHLYuEsY0xlSGf+xCUKBlLuoULn2NtrSKtbB9IfAXp6+7PIr9ZrDUnom372GGuKn
 CeOIXU86qhB8wf9NApGwnTjivMOtgeU=
X-Authority-Analysis: v=2.4 cv=FfiiV5+6 c=1 sm=1 tr=0 ts=6b094ce5 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=6raA3mogJySG5YeH4kkA:9 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: OcZh2oejQbo_88q8RCSP5Td5olBVwZeZ
X-Proofpoint-ORIG-GUID: OcZh2oejQbo_88q8RCSP5Td5olBVwZeZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_01,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 impostorscore=0 adultscore=0 bulkscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270037

In qcom_pas_stop(), the return value of
qcom_smem_bust_hwspin_lock_by_host() is assigned to ret, which discards
the result of qcom_pas_shutdown() (and of the DTB shutdown) collected
above. A failed shutdown is then reported as success whenever the lock
bust works, and the caller carries on as if the remote processor were
safely stopped.

Commit 9db31edf92dd ("remoteproc: qcom_q6v5_pas: Fix error masking in
qcom_pas_stop()") fixed the same problem for the DTB shutdown but missed
this one. Keep the first error and only report the lock bust result if
nothing failed before it.

Fixes: 568b13b65078 ("remoteproc: qcom_q6v5_pas: Add hwspinlock bust on stop")
Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Assisted-by: LLM
---
 drivers/remoteproc/qcom_q6v5_pas.c | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 232bf9b349cf..80740c1bdb1e 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -464,8 +464,13 @@ static int qcom_pas_stop(struct rproc *rproc)
 	if (handover)
 		qcom_pas_handover(&pas->q6v5);
 
-	if (pas->smem_host_id)
-		ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+	if (pas->smem_host_id) {
+		int bust_ret;
+
+		bust_ret = qcom_smem_bust_hwspin_lock_by_host(pas->smem_host_id);
+		if (!ret)
+			ret = bust_ret;
+	}
 
 	return ret;
 }
-- 
2.34.1

