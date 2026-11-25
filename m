Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631027;
	b=LMdfFm0LlpXBGrRKp/utDwkvOJbQcZ7M4JQMiimKCmFiW0m1TAvZHrt6NWCZLsomtIT8
	 5Z8RPVPhYQ1wZ038S7axj7NOLy0fDv9yRo5W/Q32TtjrW92FPFo3TGGxIBuMaKygFkUTf
	 fN5oKWlV5IokNAaZ3syeatdQBehxKEZ57Zxn/pWTW/Qg9z5tPi3HZ7kpM9SehbEL3lF7g
	 7rg2nHSK++nZIvP0b/yxitjU6hrT1yC0/1WJ50+TaT6o8VEFPTLYRSqzoSim/P65MVMwG
	 xL2k54hUQeotcB7AGNYYAJWmg1Iu8SjVG5cSbIWDOjrWa48IkMvYEOsTuRsez1yV5NA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631027;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
	b=BfwyHnCn5GxNqOJUEZRmqa3cyUhCy8OsWCWZjs2xxUZLllzpvZjWs/5jAl301llhqZeC
	 TeBmrVG1ObMvUI9C60cpg0890L9KHA5guG4F/hdFmgQFrHBqH4xt6aP0oSGDkrmnyCXT/
	 8rW3MqhVCIpFzIs3dGjB65rTDEHdSb0fy5rldh3l0hFXJgYHsNgRZd9h9Xf66gPOZpjbo
	 B3Ge0m2GD+AQZOwDN97wWzORwQfFd8MhE7YL7O1ar7G5mh6ZENa84siD14n7aRGIPY8VF
	 B40fpnx9gOlZNsjUywL8smhQscEjR3cjYcQtt4qLPe9FOtPXvm61/0E3xbM5hKBEzGw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZ7nyQuL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYiYKOHo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E72606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63E72606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fZ7nyQuL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TYiYKOHo
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQAKx817617
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=uxKxeCj5wsq
	ZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=; b=fZ7nyQuLEkQ4O94uQ34n+LlrVzE
	KEKIKNmYCAYcvae10mxvZR7lCXQkEUMd35rF6EavGxbo14LzxS+f+7cCDAFBQM0d
	JwMil78/bmTdt5FuUfIi4ZqkxsNcCq3RYxEymwOCYiUWm6NAXC0xUBaxevSCRKQY
	3FXUGNpLfzpHIQJtApzHp191ZtzujB1cfa3E94a6xQekrfSjvBN0kjypios5QWNP
	j9KTMn2sE8ckRDeaw7PD5BhvQxEfpxXaFnAaTPiIuwnoY7Rzvs3I4xKE2SG6Fd8C
	OOafxrC/UmHWj8BA3JtFdw01oAs0N5klxOzohC185Qrgch2pHjwm3MKuMLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5vuht9e2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f2005ce21so965798585a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631026; x=1796235826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
        b=TYiYKOHoFOVjpRrtRr5pi9Zp0//iOntwVxbebGIKroLsRNWimIvVUazIQYw6vcumhS
         4xXpNYA6Kaw/1N4dULBT36OSq4FwG3Alb282U18zH7kUVGyxPLc2rZC3YrtDMAJiM8AG
         h3ejHqxbUU0akzcLIHdJ7rORYdN4mGNVTzas2huqkZ+4C0EzPEOahAlU4ig2qfEeCBdc
         P94RAl1WliSDi//XRq+V2NHxjmjrrZsEo+MNp9OK5TPIyWiwmC/BZBBqSy5f/naqEy3I
         8USrZYxSfP6MVn4TuBVpy9P2+SRBjd2pKrwuitmZOdiY4Rgpnf131SbrW779WrmcvlCW
         hjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631026; x=1796235826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uxKxeCj5wsqZbNkY3Pso5/3yu6BMfXeN1V4cy6qFnsQ=;
        b=M4QMuyNd8K7GJvexGqF86CXqVuYuyram0wGJUizYBlLOm5UIXygNs8kGSC0DKcDnLS
         DHJaSI4X/GUXVQvbSKd3Kg+N1TWRiKiLHJTtFRT3AiXUN9wGrR0QYHQMa4Fp3ggJ7vAp
         oPXQfn7lZ7SFUz82XFwjaH4KPGfRoqKBi04+3FZJGZ5YTdfatyKp+3RH/A2PJsStpeOK
         r0c4MDgB6eGss63yaJn2icyyJbLJ6gSnGIfwVld0kCH9w1+je1VyuzNH/ooQl+ZkNIy5
         22ANTqeVPz10kFYy7AZtReIf6Z9w/H/9quC/DMKgsMpc2wKU64SOOFr+D/3vUD3pWapw
         TsUQ==
X-Forwarded-Encrypted: i=1; AL+hErG1IpBq0Z+d2j6I7ps0ftwLluyAXYbFvt7SiKUcXc1KKsvlizT7CtaWBAdBWL6sD3cN7hw2t0C/4KDGNNDb@vger.kernel.org
X-Gm-Message-State: APuU4Z/7VqBwC87S6z01cPPsnxcVi/k1uO2ob2y4pDSAY7WCt5UmH7lt
	HflTHzDWJ0CJqeFMSSXaOHz61kIJwv+TeWN9OqV+IWs65QaplB4+zxSF8ejz7JyRia7kG/td10h
	HweDueCU/hOIUnC88yYqWNdiFx3lwyEkRvIA3pzN3Ra5C0i7DaMZHGgABFMkvone6viDi
X-Gm-Gg: AZFdTZds+Ab7R84Kv1XIIHUR/+AjEku1y2Y6o08gTVAxtoxZYIE447MdvOvmFOFWqem
	mb6/OEVaRaiYYtpdwDJZCwb1Nz45CkYbK4D80uQqBq7ThIMjYi8hrNQKvExYI+v0Kmu/L4vexLj
	h3iCelPO7OP4AfZWQouWN7I52ZbpEb1rA0ctJZuBEXKXIZcHGY+kZVp2b2rwJtkg+9qeHHNL+lt
	re282k2axrVOsRu2jp0DCCmL3GhzDo6CfkwKbMB/Cz37pmyAOjUio7srTbP6OICq24NI84IgH3h
	r/nGotdcI/UvFdC3I4ZsoUX3mTXkfz7V+AoKFqdakAlYI50WsnreGuTfGZnBlbum4PFRUJdP6cq
	AP9CMWLbAE8ap+s/O76crPYI0VRmjUIayYYQhA3zKvED7kpAlxcEOfR6Ppo5FTMPKCxtxl06gEh
	OSZDGe
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr3248908185a.68.1795631025567;
        Wed, 25 Nov 2026 10:23:45 -0800 (PST)
X-Received: by 2002:a05:620a:462a:b0:93e:c12c:9dc4 with SMTP id af79cd13be357-949bab23b5bmr3248903385a.68.1795631025018;
        Wed, 25 Nov 2026 10:23:45 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:44 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 02/12] media: qcom: camss: Add csid pad to port helper
Date: Wed, 25 Nov 2026 20:23:16 +0200
Message-Id: <20261125182326.2767771-3-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=FPmOVOos c=1 sm=1 tr=0 ts=6b0727b2 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gL8YbPdMY_OOZm72eTgA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: px11iptjnOo6X6lSgEsOSzHYSgxp8uHc
X-Proofpoint-ORIG-GUID: px11iptjnOo6X6lSgEsOSzHYSgxp8uHc
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXyetHbCAcG7q1
 bAZ8Ut8zSuRjeL7WCrkCD8zjKP1voVHM5qhuzHl6ZstWVCc8tjlKb6Bg8VRbJvpAEAuhBfEtlXI
 NlW/ovv1jjlMQbbst9wBTlKfQZsEN2s=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXxPzSIWQb4yoq
 nZCAsDTL7e4zD6YO5ss/u24w/MOatZscQr3ET6vKrATY3MAIU8VpWI/f8BEvFTJLIQmcg7UOH7Z
 qgni9/iiNPoulmqxIIVC7hpSG1bFrkZhsaP0P5beNXxsIV742uKIyfO6Ahn5iFJ2SuJYc1RS23n
 bKscSNxspmf0LY7uCD/6sJxIUllHH8jhegvNWzM1gHdO6L1DULVKm/LWemO+L1/HGw+/iHrCkzx
 TVRsK0z/dVMjTWO/qr7GFZoufjPK+sXZO4RjdvX1hL+mMptnZn1NXiPf1e/PSNNKTCRjjowCUvt
 2Atbel/1cJcHE5hmEtg/Zz80rl+zq9H5euchLCIxHCVlPiagSA0jFKYCMJgwFW7cSh3ssxIMipW
 FbJXE9e5bq72Ao98hrT8mbZBrCEr1FmOpPkmGbgZrdAk0eYweIFjf7Wa+2w558BnLz7rQDydFSp
 8r0Xaa1sd3ytgTDpaEQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 adultscore=0 phishscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

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

