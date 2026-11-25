Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631030;
	b=k7t8KfGfKcnL0GEfaqHcNuEKLCEwHMYjeW2kzKNkfJ314//KQUV/T/WKwSvEIJ5l4v5A
	 O4dxgKKD+PKvtLRu6c5RTcoR9tACy+UHcWSBfxpbAy4OOwXNnYo2z+Q4Ye7emxVRvKJb0
	 p53W4Wg6KSvcr4o3A5KP2adsX251Ylzqk5xxJ6RUZtoXOnpLQo17YbxU2j+/b85dTpyCu
	 zqq3b9wGjvVUNuqDV5onuN7zx2Wa6LpKGqeXRqCfoblrJyWYInlVFxUPfqn8LDI5BAhCD
	 Br0qpLxWlhGqMD+/Cb1GYZXqffZp6ZIDkUgyjAq0/BazvoDcjdPAZqgY8V9fbW74GDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631030;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eH179ZcdqoRpZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=;
	b=FD5VOIzdG3lyi//kdoyfzlTAXRqNKpP5aCtwBr8X9QjyeiUQx34AADKbRzCaoCKQukqn
	 gQdWNcMn68MplfvOaVJdRLQ2uo6GyFwg+RU6CViqHttT7NOrGSVHYa+TTNbdT1LBPgWiV
	 MY3VfpUywI/us6BJ5MabG/ALJ6Ujhv9K2U3Gg+6mVKXLt7TiTOrcRyYK889EgikBvZzQw
	 NNnPz3dONk3s6vIUIDHw3WbWnVY7M+yJy2/EAdTuzQYNpfWPj826H96hTKG4MLf0IfScj
	 9d8TcLM2hB8mFzJHnk4o4g0STl/UNfqTss53FGRf9E6H8GFKmA6qVhwzTlqINTFgmCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y92po+9b;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZFcsTkng;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F99606A33E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 42F99606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y92po+9b;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZFcsTkng
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQEBS3230328
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=eH179ZcdqoR
	pZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=; b=Y92po+9bythQsJKX/6bAf3U2/bs
	5QZhvFlRABZdA6PNHjQgVEel31cMrHaiGqTze/cqMNJDuDkdnVKE/Ub5nyhVWEF6
	8HLtu8wxaDMj8HxbDZHNesYgtM0D9uKJI4PZwxMJy4XxTPa+/WmUKwa7eKUp+ues
	znRz5TuwS5GIsQQ2pZ8gluORLTgGw5Zl0Cokj9p8jjObzDZth/XgxqXv3YY0PiEu
	T/wYv0BCDoo/QB+QaTspaXEn7/58wVD63WZQwz45Bvet3L22OEsAB3zUFhb+8/YC
	o+J97CUllSQ6bfPqLzJt8vrd5lA9LXbz/2U1J7lQFMYwDSLUeCeL8yxIYvg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5nu6bwxc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 18:23:48 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso691122285a.2
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631027; x=1796235827; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eH179ZcdqoRpZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=;
        b=ZFcsTkngQNU7yA7/Jp/Q+/yda2rgFyix5I+o0PyHI0zh2MmUD/CAsjv0OsD0odtzyF
         fWhWSRdWXY4g7O0jpV9BBpzw0SyifD2+BrafbzdoekWa8zYiUulO8vN9XoCHFL5EXdrK
         dj0iOTMRdegPorU9xyp3Rp6c2bvqf0NgqLsh2YMGM6utKNMJPjXoXspd2/rFcjQ6pGNj
         hs5C6Tjq1f6Uy/PM3DTSFN2yjofnZ15jg+/PhaAmI3OuGUXquNTcrq0iaLOTmwBnJVOJ
         P0SWxPZEd3LCU42+gSXYhV7V7YT9KVRc0sPxM497G0rVUNQLiiSyKj1pgOzkOMZE+aYw
         HNaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631027; x=1796235827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eH179ZcdqoRpZcv5aMoNRNsFZzTXYPMc4UPUUXcVolg=;
        b=bEFTLj3UbaH69mdGI9kdLwrYEdwUCsSTbnrrDScgUu7hvngJLm3fX6BqC9ja31b1Hb
         JErB/hiShZaH5pnk29ifHLPg2mXVJBhe/5vJ2tioAusAucXgWUAUVWLQfBBNBFn/Mcoz
         mhHo4WQTXAXAdNHN773RKYZIvDZVSzVCgj0RkWdfTTL3aysEPJXjxVDaPovBC39bLgwE
         cX/o/i7gD5V/lGLpS3OvA/OvWtVYVVhRt/D56KuS+UyyJzC7ypUMDcu8TtFnKlSU0jIa
         Vx3d9NeH/KZk8mS4iA0Fam83+UEu7HJGoAB0UZYU5N5vtg4hJfdRr/GOrH9WLUmh+bdR
         V9PA==
X-Forwarded-Encrypted: i=1; AL+hErHqWub1Hh7iWKp1I9qeHWLO9tkMgVjzSiAYgzvmS/L8VIiCRbsI2w/Jv2q7vS5O55UR4U7XAH2gDYzW5i9x@vger.kernel.org
X-Gm-Message-State: APuU4Z+v+w9oR/kCXXSBpWw1n81t+YRv5Bpla5kwiqE78bzPaLRvFnH+
	r5rmho60BKUc5p5zOygAdRqF0nt32am74tjnuxptf5wF2hpePviKx/C4sONy5PJ9YCPEGEuP8RH
	kO/BavUR/QvKNrqWB576KE8kbOZ3U2NDlaDT+LAe4x5D7ZEaZ5l7mpacChSrPDer4cDjT
X-Gm-Gg: AZFdTZdydOAKeLy2QM/1mckF7XtzcUnIru4HiOsCZDAULxfWs3YXVadj6WWGnUmDPW/
	pp9a9+L72pn3zOgRRBCO9kr2os18GvZt82dF5ZL0HDKBnE9OCnDyy4Q9xkHm0Cyvm7rOnwyiDv4
	VgZQsDV+JvxPQjKhuhA0kipvcaJBoHfqtlYgNbau2CY0U9HfmL8j31fVzZA9RCmzkyhPM7V3hab
	H7kEuccw6XJocxcIjQzU8NmW8V9TOanz1e3rFP9mDkJGkAxy8GC7P7PdzIhCScSBltA1IJkjJHu
	lGg7OmQIu69C+LeTKd2uJV51BEgMAhQKm6GYvRLn8CYABy22lcuHUZyjUlcf63Jw8h3sg6rNzQP
	bo+veyfC8+kVEcUpKvcRTAqtGmCSMaWt0+zYb4x2XVHI/fbxoXwNKx4eFgdWR6f4HLNIJmfJCVo
	pUslIm
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id af79cd13be357-949bab3e44bmr3196126685a.73.1795631027075;
        Wed, 25 Nov 2026 10:23:47 -0800 (PST)
X-Received: by 2002:a05:620a:2685:b0:945:c4b9:3de2 with SMTP id af79cd13be357-949bab3e44bmr3196122885a.73.1795631026642;
        Wed, 25 Nov 2026 10:23:46 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:46 -0800 (PST)
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
Subject: [PATCH RESEND v2 03/12] media: qcom: camss: Add streams enable field to camss resources
Date: Wed, 25 Nov 2026 20:23:17 +0200
Message-Id: <20261125182326.2767771-4-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: -qsKD3amxH2QaOzPVxnlmmPWDYHWQqN4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXx5WH7SGhEV9q
 ClqTekqKD8y3IFlnp283LiwmAelVmOJ8JEa5Sn8jKPDsyY4OImEiC5NHmEEPzdyIgWSwBFVPR8s
 XniTiAGNZZkDjGnUAMAZNvtFm3wI+Bs=
X-Proofpoint-GUID: -qsKD3amxH2QaOzPVxnlmmPWDYHWQqN4
X-Authority-Analysis: v=2.4 cv=Vra2kO2n c=1 sm=1 tr=0 ts=6b0727b4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=Zc0e2cZeo9r8mepgbREA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfXz1UnF01Gt0dV
 vmwheBp8103GcjBUB6CrpopNoEasvq2b3oB/oZDD2D5uTSZp1JGoDL/rrKbLEBTzWXc6vCvxoIq
 k7lQNHXj4A1L0YH71cDe109oRGO4ZWmk0PRGcWB1fhwlJp/vA5+iW5JSrNZKXDM67aYSDrbXjTC
 yxD35WcgljlBeXXixI/edh8W9vEofKovOZ2wOZW7m2zgZNagOy/RWRPhWv4isdiv+pGm1D+41iA
 ICDgtnF4vtQ58fFziU7MYgvUP5FuEJmZCRe5IY306sTmpLwegTVVwmhu7sFbMZYdhKkGj18Uw1O
 1X8cLGjUiq6aOIyueGzK6FmCcHNeQntrnuq3te6I1dwOxkxpLXcBCXwpNSx8TX5a29zXwxrsS4Y
 A2OFi1noxTJlxrH/r+x1wTETA9rhFTNGJVDzp9ffO35bghzgMX6pvz8Rnlxij9wPNQPeg/6zkxx
 UxRIRdAayymp+aQ+c5w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 adultscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250073

Add a per-SoC streams_enable field to struct camss_resources, used by
subsequent subdevices to select between the legacy s_stream()-based
pipeline and the V4L2 subdev streams API.

Suggested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.h b/drivers/media/platform/qcom/camss/camss.h
index 7564a7c46fa2..621ea2e3eba1 100644
--- a/drivers/media/platform/qcom/camss/camss.h
+++ b/drivers/media/platform/qcom/camss/camss.h
@@ -121,6 +121,7 @@ struct camss_resources {
 	const unsigned int tpg_num;
 	const unsigned int csid_num;
 	const unsigned int vfe_num;
+	const bool streams_enable;
 };
 
 struct camss {
-- 
2.34.1

