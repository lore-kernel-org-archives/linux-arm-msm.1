Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792802165;
	b=qAc72oq4wyGSiyPvU6bjugDwtAtNx7Tk7Jz1BbdMW2eZHFfJmbuZ9A8uKENwWO7mgeoL
	 luruIiJHDGky50FaV/YsowNhM6QcWc2URFUP1+MVWpDpu3wjwJfdDo/F165w/txgoA0Eo
	 H+JViN0+bQnCqdn/h++uAuTkiz18/JU+Bz6NObpIzVGLFdp83VEn+OmUzuIftdHQpJSuw
	 46osT8qn64UQb5XakreXkY/ipzS7m4DEBnKjagHirAMWVoXV4kL3zJ5F4VVvvPSktNxMs
	 9gIoBd46FrniBx+Og7BDRxHIxcTL5ZKnINFWpiJ0/Yt7swJE1xcQaqgE285WtPebVbw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792802165;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
	b=ucWmrKSSkSTtJHyoA9ZQaVRzAtzICuJjaw58eY9kR839RbNODUZL1MTq0SqEjM6kyd4d
	 Ms0fq4GYpjjy+CNwJoo/DSjjx0DbmOh70i0VVYjovBzVOlodDrKxNm2PT15BfQFImoBSo
	 rEpasviQFubcWh+P+NWuvy7Mtikj/jcYtMcxQWI5ksOnDUFzz7rnhwbdfJqHk9hySObqW
	 YRe/oKl+850Phm8SDSPFibyYR4NXcWj+SICf05VNuLm9PazZnMQ0KeJg7gWsIrTwYrNOC
	 jdBOoVzcn8MQ/OfyMiSpRY+BlLRh6J0PbAXBAT0ZaLRcN9dGiSDJK1nVh7MGSs7IYAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gjepgwal;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82BB606A31D
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C82BB606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=X5PXkxML;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Gjepgwal
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NLvLeP3117159
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=; b=X5PXkxMLShfVuQpn
	RNM1czD4Xr9K5BPvqE5YMV5/fkXBKuCvX5kaFmCAc3N2KE/EOAGeT0pjYdZXlZX/
	4YbST8blcDp5A2NDlKMgOJkd4VcJZ6fwWHJwHWUXU8zRTVJqrdIM8RjHeWrhU5uP
	SfOj/cTcskr9F+dxhn7Pf7EAKjRjMmkRo1x2CU2ILKMvwptPdA2kn8Xy7hQ0dnxN
	lZbDddUSi7av9O8I6waKW5oZZA861JtZbsDQrJqS6lv+G87HkfOEZ1meQvOSAb7j
	AmbSPuhLRvG5atn5Qaj0U8mv+QzkdHMce5ud9yuUevdmMhtU8wQEMHgIQxa66Wbn
	Z0+ibA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgcrt919p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 24 Oct 2026 00:36:04 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f2005ce21so240821085a.3
        for <linux-arm-msm@vger.kernel.org>; Fri, 23 Oct 2026 17:36:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792802163; x=1793406963; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=Gjepgwalawo9HHnd4y/u2q3Zf/Fa4XgmeCbtZaSXuvQGE913nIjSQRcvHs/w2I6epF
         eGsefH0uzhFuosDMsroBGsro2yqFCov40HpMOoxU9/eL2HuPxeW7WXZ2deu64HWDbP4L
         HufYvCseT0CA+MROFrEivEYq9NrC/Qtd/JSjH1sf2CsfIu+uu55zpDZO4WViigDxyGQp
         Qaj8rJA2JluXOF9iyTo15JJAgcsa+slbO9iLOgj01gXl1Cy8HHoMl8WuwCZWIkmQMe1N
         siBh99tVRYgly9kQORGweKkdCOuDSSQnXppUEHRs3z9MtMCZMDmwUKZYZL3nBAjmc2e+
         Fj6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792802163; x=1793406963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jslaJ+w2HEyT9CXg0MOlXKm6PZnVP5VWPAUOBFNljSQ=;
        b=iBTbogNbFWowArkio6YzEXp18mbYvBttiF1okvZWodY9AMPuwoG+ank7zLf5ZjBR80
         2P6JwI67wVgKJ/L/6IjGbwSa0We53Ets/E3OEOiWyvDXqWJ4gp13sbTi+46s8ZHEvWsw
         pIPCseKsS/00j+2Xk5iK8o7gQM/3kUOZj/QKgiQx13pPrw1LDQlz7ZpWakutbk/OA66X
         KF1TxhIBMnnvpDi+1HQdFWn2LWTLa7/RcpeIifL2VZGcKUSNC6JcUfgQr+uw7b8u2xg7
         mkU3CEzdSdDnei03lLBbPWioJ9ptSVdU9f7AT8AEaYq6QCkvgfLhtDzUjwgUYxnL8cde
         M/NA==
X-Forwarded-Encrypted: i=1; AKwUvBwPQEsvNLu0XvQugUlO8HmObyjgbh/H47CNA7Sec+Eh2kTmlDTpSBImO3Qrr/ZXuSlbGsuHalklhmDd9CsT@vger.kernel.org
X-Gm-Message-State: AFq9FYIYmGKhN4lBaha8tViiuHIyGf0WQmFx5Nq66sUvS4N5XtisRA+M
	kQPpbffx394vaDT4IhALuQPQbi+BLZZiywsts3a4RxR0ixX+A0AFez0lpCcaWkXLd0RnJOY69Z6
	iicYJvwHIkizWJAQD71oBEHiaK1oNOWCRiRo3XApiPfyB/aur0R6/NfnGJaYeWV0SxVDs
X-Gm-Gg: AYBFou0WuNRTMtIuEMSFE5Qnr0yei5Bb6czNwbkYRa84YY0TD0T6N6QNrR/lDhWYhpv
	Bi9ZxQ0w8KbOHe+7deFfeg8qQR0i5xX0ZIWFohQWIjjN89rO1Vc/5QpDzfhAFgLoy6aEUQrtoqO
	dxypJvWzwekW8b2hhbJ0MMaJINhEMjzsKONmT+qUgkCLzKqHSgIDhmHb+1ulJZi7dWb9U+YDK7H
	CrFt3cNTIkEis29+7ceYu7pFQ0wXgrrQ/xuuLYPpWp8gqdJ/u7E2mimzxonaZfYnQqZSM3Kxuq8
	cd0ztWrze5Ego3YsMgLJXGnO66u6ZBMfVjsTvA0ABrNx48e9DAU63NJfUdlp0XJOmU06RCwp3Ia
	+RPB79pu4L+os/6N1Pdbwzds//+YUip0uDXg5o8pD1Cy0wArOxL2uPiXcbyrvNtRFEB64DnPFrN
	8VRFiF+zxCXQef
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109938085a.46.1792802163132;
        Fri, 23 Oct 2026 17:36:03 -0700 (PDT)
X-Received: by 2002:a05:620a:31a1:b0:93f:1e3c:4a3d with SMTP id af79cd13be357-940ef956c10mr109934285a.46.1792802162668;
        Fri, 23 Oct 2026 17:36:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac709d1cf7sm1126651fa.15.2026.10.23.17.35.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:36:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 03:35:22 +0300
Subject: [PATCH v8 6/9] drm/msm/dp: don't take extra references on multiple
 plug events
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
Message-Id: <20261024-hpd-irq-events-v8-6-6ee949e7a384@oss.qualcomm.com>
References: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
In-Reply-To: <20261024-hpd-irq-events-v8-0-6ee949e7a384@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Tvrtko Ursulin <tursulin@ursulin.net>,
        Francesco Dolcini <francesco@dolcini.it>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Pengyu Luo <mitltlatltl@gmail.com>,
        Chaoyi Chen <chaoyi.chen@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, intel-gfx@lists.freedesktop.org,
        intel-xe@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        freedreno@lists.freedesktop.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=903;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=y6Q7UwG8h2RY53M7Uj/FBYAupAUz6hR7YBAr9z2d9v0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq2/1SgHKkiJWw2Q/RmkX21UPsNJT6d9sWxsWfN
 lGk1cDfUG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatv9UgAKCRCLPIo+Aiko
 1abQCACx1C1gEiCjh/JA22nJY5oMv2sH85fmApV29ur3ZJHiuL544WoNV+08rQuI+2s1l7u0BfB
 pSH3B3HC6A7rQlqhDPIA2ruMLYYYjriz6QSC6lw/1JonyaVTNNm8xvMZ/VOSDO60jZpXprD143V
 EqlmhijNpaAWTY4Echcgkl1UjRZvVlWDS+tyd+BfNjvz5PIPoLfUR50gMU3moSgcfAV4eIbHFr3
 LQcvtn/0yLkoo4o5hAATZZOchduLmibkjvq2qCB7lkAlkqZMg6CummmnUdc3zBbEqljwccC3sPw
 wbS9DfpRqegDI381OagL0f5T4ASlv7jgolH3vPOzjKcXhbWk
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX+G67XczulLRi
 08wNldfEZw5Ygm5Onwrht3eg4/ORLlz23IrTfg6CSI8cAZAm+CdoLgWtnISQ2jb5dZNsfBIzjQP
 WC85x6jtKP6OLljRgcf/k336U2eXeRU=
X-Proofpoint-ORIG-GUID: TRib-oPxdUY85DUe5M1s0mM5yhrDcddM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAwMSBTYWx0ZWRfX5T/n2ZjoOMtK
 Hg3cm/Xaa3MVv1ELFLypmv7D+nI8YXI/XPgdtgZk7VC9zJri+z89nhvDamTZkpf1RJAaPc3CeDY
 Kkc9KcbS/hV9r45UMDaEBvpCD2DEKgYkdh1JifoguDQxyZLNcvxpFQvkb3s5Qo70tMmjF41+O0E
 7ZY/x7/aMzDjN0avdJCy1On2avZyZe3jVf7wPgU1/E+7j1aql6srTo1NFwjURa5XKGptNHZ+8Pb
 IHNvMBw83NFsW1LArvPY/to6ZUTzcGBvjyD0oZPxHivw5eycHwmqPBUHDpKU43cI4lmxeSw70Dn
 xqI1odmiKUUgbRnAPhPwSydrT5oRo6eUvaNusl7TlYE3e1vF2fEMlXecNSjFhC+Q2EWtHruobXu
 HAWkkde6jUsl5IdHccBoaWyeb6aCz5lsDkbYfXOxZL3o42iKWXK8w/ea3a5QDIl5tDmC6mkXT5c
 d0MJzmRe803QPX+8u/g==
X-Authority-Analysis: v=2.4 cv=E7lYNqdl c=1 sm=1 tr=0 ts=6adbfd74 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2dNI1gAXBh0p5IwnqgcA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: TRib-oPxdUY85DUe5M1s0mM5yhrDcddM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_06,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610240001

The upper layers might signal multiple sequential HPD plug events. Don't
take extra references and skip all further HPD plug events until we
receive the unplug event.

Fixes: 3ea2d1c3d154 ("drm/msm/dp: turn link_ready into plugged")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index fa8942922b53..ce919a26fba2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -412,6 +412,9 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp)
 
 	guard(mutex)(&dp->plugged_lock);
 
+	if (dp->plugged)
+		return 0;
+
 	ret = pm_runtime_resume_and_get(&pdev->dev);
 	if (ret) {
 		DRM_ERROR("failed to pm_runtime_resume\n");

-- 
2.47.3

