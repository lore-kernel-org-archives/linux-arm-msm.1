Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795593612;
	b=SQGA9goeqARSgZBdTudWymvzSH7nHzGpuAhcPQcKzZB82cQjL5FA/N51FpDPd1tgMriS
	 VYUM0cpacLA8QS9a7Iq/+/aTKU0HTCHvGtDwQJRn8dl/1/ItrrkGvQF28cN5eL4iKSe0E
	 c/SyRDRp9FOEH4qPO3Jr9JpM9FK0VsBXgmvt17nRxjbmrUIKEI8YVYWiuiYpTRBOQ4fOr
	 wAfhcdoNcLoX6PjJvu+L1PZDdrlhgWyoI8TqJuB3SayP3jyfNSePRGgWGoXRKDqQA4OOH
	 pEwC/JmUcAd/XuUJyioik5hdHL6dsEK3HLgLr8q7gc+1JXwyZr6xyXFZFt8zbUXG2fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593612;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 X-Google-DKIM-Signature:X-Forwarded-Encrypted:X-Gm-Message-State:
	 X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
	 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=QZqenHJHuvpcFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=;
	b=dI3/GH61IF7HROfXrziJUelM1P+CG0QKNlycopjh1BtFjzabk5s8Gy9uR7iQ4PY+pIhr
	 Tfg8W3Tm8sZgfBTMmO0xKthHA8QZzqPV7pK3zqcioXGkSFUp0hn4hkkGI9UNe3LVYMQoF
	 oSsqXLzOM47oQgjpozTROtLqL8x7mhe0sVwSGBIWK2c5qdHGhN5i6mhm1mYZ3FH68ntOp
	 X37kXU+WB7ZG0Y9p0TrapQH7/5Xw/Xryi07N9P6VwydJ2WNrKRYTkWW4+oZ5Akm7ytZ8Z
	 FyFx9u1cAIXxQppamhUcP6k3OfPlEiOtDzocDgXa/6AkENFDdFRXMrobXQegb7bxyow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=fail reason="signature verification failed" header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCYvtYsx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 257D0606A687
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 257D0606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bCYvtYsx
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP68jMu057312
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=QZqenHJHuvp
	cFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=; b=bCYvtYsxLXNYdxwoJyQIm/UCcVH
	zW5DnjDxvUPYxBNJD7oo2ivT9ftJOT7BttbJIU1rEjDANjmw3T85K7OA3Lpe2VlT
	MNxq2ACPtnl5Gbvgq9LXl0hFQkdQncOGbJqAIjG25dmaLrQ/0myNcZqbDfslkju/
	/XaJG263TiFeocOecLwI31eEBq8OZg+nyK4inU01GkL51wG6iI/jstZGGgdY1p5d
	N3NiSXg1ZvPjsJ0MkIyjvn1en68sBW4SyxJieYPWxoDIEcnK69DMBkp9Znu1qZv7
	zrRxA8+RFAkJFqIdxEnExaZm8iKdoAww6rYB8c0XTtNtGXLHXRg3Zp+yyXQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnfad2u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:00:11 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9496ff065bcso751794985a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:00:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593610; x=1796198410;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QZqenHJHuvpcFmonw/+lrZ9R12/PrmorwdB0s5e0yt0=;
        b=pTaVAaz+Q8xpY5m5lczOzLGdmhsxlXRhjvUynjtOFuLFyN8xqxBtk7hNIBdsUUTq8s
         8prJ+J37b+bmI7KU5yVV/VroLWDGv4mHYVW9ON2BYIcr42R+z3aEAQndhxWkmETSr9Em
         jLk5Mdpf4OkCLoTZ/H5RPFAEvt4y2tWypNfVxqQ1rOtsXt7cjshwV0DMETGI9lJbBRJB
         /XfpB5Ebf+tdOPoou5hML1D/x4ViI7kvyOgioRDJjqpjiWANfIse8I2QvGeSnfJcmPOO
         nnC0CFpaAl/v957oewlTCHAQrOoUpiF8wlFmEnf0ztUOZqqlFtdyYOe+sxZ2mJ6pOQf9
         a/IQ==
X-Forwarded-Encrypted: i=1; AL+hErHh71Kx1RHq6JbmX74GV3ARoSCfXui+Iz75cinNbTwFdtzYdBmpjYCbXVbOye7kIs909OCkipilzoJsrlJQ@vger.kernel.org
X-Gm-Message-State: APuU4Z/KZtKXA4qjiol8uKQcfyNIyIcoVKn7w+djMTqN/qvLKSS/Akzm
	nkB7SF4Ll/9RIoarcrJu9wEiaH2kvQ2jHkeYBmgqoR9WWW8ndOvDN73UgKmby/pMfOz/iqG49+6
	gqT2T/I5VwOTC6EAF0i5GG7uZPhLruoJYmC9IxKPKZE4PN5qn3rYBRZAMZvymS1eZmL0K
X-Gm-Gg: AZFdTZdfjuAXVKN0Mon6sObPmMasOfwEHkfB1uHghb8IUnXVP5v8hett9JriwyGh/Lo
	gMqVaTHgRZlaTI2cuihfJX2Yd8BVCTC1qXw+NgphB77yH/wXgRilHBoPMce5Ym/yjAeWZ3JB27w
	4uB2eFnefOVP3bU4v45HE+6N4Acwa4Vl1d2LtB1CLfK99Uh0Yas9f8KG1xnBdVINUHjaSdO4air
	Mp9N+/VumuYqoeQuEzSMSvlnts40ZuXSonALc5sMPi1mFVxqaAjAYLNxGLmEacvUFk1Wp1oMMrm
	hkI8hwTrofdnlx9+JyAgK5g39JXSrHuAb0ofnwxtNvIesM5UXvSh1iuWslHUyh/Jc535BI2SMSO
	vxd/Eq5r7yOLAcXXqUBzC8merQpTkYjLJ
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id af79cd13be357-949bab2a981mr2985232585a.72.1795593610381;
        Wed, 25 Nov 2026 00:00:10 -0800 (PST)
X-Received: by 2002:a05:620a:6602:b0:949:74d8:4706 with SMTP id af79cd13be357-949bab2a981mr2985229785a.72.1795593609971;
        Wed, 25 Nov 2026 00:00:09 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm585912015e9.11.2026.11.25.00.00.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:00:09 -0800 (PST)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH v2 02/12] media: qcom: camss: Add csid pad to port helper
Date: Wed, 25 Nov 2026 09:59:51 +0200
Message-Id: <20261125080001.2540101-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125080001.2540101-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX6z3BkrgZxlBH
 ggFHxVyt1HuVml6ceQx+1b2OpeQC1sKR0rH7xyHU0ZrhQR2FN4XRnGfZNI6JkpOYep52CByPv87
 9TuMORl77R0xElxcvhU/lcNG2Oq7tbc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzMSBTYWx0ZWRfX4eCPZqUzZKkO
 0t57LXmfLr409o8NZG0VQPwHttPe//BSiNhJhSVgem7HdVRJ5KTlkM81/pLT+l/BjuTuuVx8aY7
 SzRhuZGt/PzIyZEX6TIt0ZjE0yJdWyrMCOMdCoG3yIJzUJtpW4QbZWQUL7jEY/6tYK/QfJp7Fmr
 W2RjMsgLFLYgtH372iGHOY8tTatqHHjQZzgVZ3ZQY5rGzUbmslAjt6GtK5wugw+i7aQtCWnQPtJ
 fGCrtAre3JCuNJZG70ZnZu+SMSM0mAslLt1qmg3onQRlWq9q4GGkopYyBO3wEc4syIk3YI4L8PG
 M0BY4T5fYd80FyNCD/ZRFFFma5RVM+U2IO14KWsXHhrOxKJkW3FoKeGMVQI37n9wRQYABeKecml
 5j+UWY4U6rU9/eAI/DzdO5fCoXAH5nauXXJ+BjLvZEp77LUR+u1C1r8kE2jnOh8X7F0NDTU5clA
 Pyaj2lLjwr1g3EskfTw==
X-Authority-Analysis: v=2.4 cv=f/Xdl+yM c=1 sm=1 tr=0 ts=6b06958b cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=gL8YbPdMY_OOZm72eTgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: SI2V_BeeVmea4U2N_0TFBovdiPGt0QGm
X-Proofpoint-ORIG-GUID: SI2V_BeeVmea4U2N_0TFBovdiPGt0QGm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 suspectscore=0 priorityscore=1501
 malwarescore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250031

From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>

The function to convert a source pad number to its port
index, and use it in csid_get_sof_seq instead of the inline
subtraction.

Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-csid.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid.c b/drivers/media/platform/qcom/camss/camss-csid.c
index 588122beec85..0f819c34e760 100644
--- a/drivers/media/platform/qcom/camss/camss-csid.c
+++ b/drivers/media/platform/qcom/camss/camss-csid.c
@@ -1356,6 +1356,17 @@ static int csid_subscribe_event(struct v4l2_subdev *sd, struct v4l2_fh *fh,
 	return v4l2_event_subscribe(fh, sub, 0, &csid_frame_sync_ops);
 }
 
+/*
+ * csid_pad_to_port - Convert a CSID source pad number to its port index
+ * @pad: Source pad number (MSM_CSID_PAD_FIRST_SRC or greater)
+ *
+ * Return the zero-based port index corresponding to @pad
+ */
+static inline unsigned int csid_pad_to_port(u32 pad)
+{
+	return pad - MSM_CSID_PAD_FIRST_SRC;
+}
+
 atomic_t *csid_get_sof_seq(struct media_pad *pad)
 {
 	struct csid_device *csid;
@@ -1367,7 +1378,7 @@ atomic_t *csid_get_sof_seq(struct media_pad *pad)
 	if (!csid->res->frame_sync_en)
 		return NULL;
 
-	return &csid->sof_seq[pad->index - MSM_CSID_PAD_FIRST_SRC];
+	return &csid->sof_seq[csid_pad_to_port(pad->index)];
 }
 
 void csid_sof_event(struct csid_device *csid, unsigned int id)
-- 
2.34.1

