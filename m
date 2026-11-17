Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794908403;
	b=JsUkxKNbK71Ht/5yWo955BT8TYOWTOknjtfGTNW/W+TzO/kRwKIIR2RhTV/eL5AYJab8
	 zDXMkkI7zd3N+/KVo7jOSpIjxvT2vl5nkFUijnjpc7vGVRLvmt0QIGqZO7q9DM3wptcUd
	 AVxmMr4V2bjCNtXXzJVO9NWk8W/A/qhulnbatbTgvwm0AFvkLtyt6QPjqbl947Sx4nkpT
	 zNC1kSejG5vBlYjEfU2/fof/rXHlj2HIbLFI6p/i2SXUvZbyPCKUxgj02rWLC57galIhe
	 UFhYju576agHB1z3sONV+BejtwicBkfqB+gTdIb0bP5L1MB5IttcTbrsfNxdcMqY8SQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794908403;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=;
	b=ansHWH5ySbNcTYJv+NkKGfbK4H3ocNtEK30QGZb0tZmXQ8+FBNulMfFjhiYYr9g2mUOX
	 xiKWTFyIq/MIVayFIHLqX0Sq1Ayzif9vEOhO3Prdztor0eEWUzrERkDFA3DRRlbyxvG4g
	 qkAwBhJ+X9NG8P27POAQ+OCg5k6soXV9OYh10r7E9mXgiR/VAczjYsbDaZB+JCvWD2hzu
	 qnf8VqfvX3GSPzulQ+yzDoKbW1OJBljxlukejP1EeZBz64BKfH2nV0qUsJjkAhzqEq4j8
	 vyOorg3NVLjS16PdhFhxqRPfTQ5MHysTI1lhNn3iuIN/3F+2cqUtrlGEhAZb+RoBkAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V19wbvnD;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sovk8e4e;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0BF1606A334
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:40:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0BF1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V19wbvnD;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sovk8e4e
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH8NLKF721616
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:40:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=; b=V19wbvnD1BZG5TbH
	vgajGS4YB7fiIjwUpJ/5fHnF/EXTc0jt1jO92Kq1zizBG6jgB0LWwq2GUzpzyite
	qiAzIFismlNhqRPoC8Tc5Vp3ZnSuk4Vc+CvHq8F98nx+iQMI2E7+inoYJBCDFqBB
	alV6ja8wD6cG8VcYD+jPgIWj6z8lOARDEjmARANLZAFtufRxORKOQ1ePBm4ovEeJ
	KQLVIlJY7owkw+VbEElMCkgXeMwiDR2AU09OBZ5+zmKcl45WyAoK4kQHyk9/IFLt
	aKbuNbIaW6NnJBTGz9a6Vx1HeSvxJkQ/+4kcGvtAD2AMypq21lPTHbwIERpJRw4O
	wy4Smw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0kcc89vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:40:01 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd60e4e8bc3so3002692a12.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 01:40:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794908401; x=1795513201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=;
        b=Sovk8e4exB84jEqI/komv8rPaU1DQ0B3P9n1g9ovYOix51mMGoVGh1k7Y6uDoZa7Qj
         lRawGQv90+zvhaj4YDKPLyQ2ltgEEoEXfm7ZiEpGK4C8OPd1hPOM9IjTZCoVwXEhVyF3
         7tx3jhSzu1TT/t237+Igm+G3ZsDd8N8mPF811Kbxfp0HMeCzrLg68K7bHA18Ake36Q15
         Wk+KuL6OdTnVpsb0jyZ4D2rb1dgTqJtqNqelwd/EUh7pQ2fcoqmbaQOt+yj4ru/TZvDC
         nsdOf0N85uOFk+ZmhiVL1oWfCi2VpqwNAmwBGjSdLsDEClaHdNtHtIi1iESIO1UKQLJ7
         2vYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794908401; x=1795513201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilszVt5EJO8vNtjBpB9Upv9ImKrzH79XOam2vV/Rz8U=;
        b=e7WdGSXZbQaBk5BRQCrzh5NVL66t4h+6rzpB5ag0Mtn7rKl94OmYKDz3KAoFKVyE0w
         Th8rGSTfwIOjzm/NpJnFdRQt2P+5Q22xsfNBU4g0137JxhZyEf4pH9N6GNniKcxgmpld
         2lSNLlXsUh7IiIkiI8KVQ36MwmgTVCpSk6GPRxg/io3szEbeE55RzxvwR4B2iLZJY8QR
         72OU7V5KQZSUUZ/5auqC+pH5NFF3qwJyJx2V/JrD+yiA2C1SvqOTZGntgjQ2EOR26KM+
         SThLEmq+4/ypzsRGkpRuC12+1xlPMTPtIk3yGoK67nEdWGKrAsyKP5gA5XOmu3TZ1sF+
         kpYg==
X-Forwarded-Encrypted: i=1; AL+hErFRtiHO7nHTQgZKgAEzlyN6ukUuy3vbeskd35DV9Q55Lz7hX/nhrGleknXcV0mTjO6NKiZb++JBOAZlzVan@vger.kernel.org
X-Gm-Message-State: APuU4Z+FVT0MEVctznyAFuATkr786XKdvSgxZVbBn0xOoMi2PQfNA5yz
	e7oUd6HodVXd3eKIo1Jy7scbR/wI2959IZMG4a+p1y0ma9VmCPmuMKM0LFwbgdutw1kywJs7zSg
	TKGb5StgW6EypIFrWmlfiMipE9nVxw/BI+43L4FlrL/Vwxhm8CeQxLBD50y34jOrrAvcy
X-Gm-Gg: AYBFou2kayAoI1WjyYVXoynLRhdAwR+7pNjjDGbEjQnx4MqkQk2WkN6kcGEiTwg20WD
	KRR97n5kF4Kw2qiTzOO3bDzbewkd7rKS2Rmd5CO8OCT8j4wgJ+w1w4xzKiCsSE3kKNuCBmRx7Rx
	h/hpz5Q9v0mu4xfWvHDnDY/2pCtS6aTyrooDQb4kstShFUR+7LtDwbOkoDst3+LLOLmuFqcNJhx
	LGwcAkqs6XI50QZxHEOhIO62gvOiq+Qtr6a5Frb0rfGR2m4UC+WCp2YZ/PGDAyv3qxHWo2F7ICW
	VfETHBegW6K0CTn4iiR9n+fhCqukHvGIc4Fp3M4vNRJHG863n3A+Vs1izeTlnRRg0Wg9RG/xSX5
	1K16P67jijoX1QZ/1R4AJIwJAN8JlXo1xkkNR9V9tTI1bd9eqm1vuUwTp5g==
X-Received: by 2002:a05:6a20:d74c:b0:3e0:d508:59a6 with SMTP id adf61e73a8af0-3f7a71a6635mr11751755637.13.1794908400546;
        Tue, 17 Nov 2026 01:40:00 -0800 (PST)
X-Received: by 2002:a05:6a20:d74c:b0:3e0:d508:59a6 with SMTP id adf61e73a8af0-3f7a71a6635mr11751734637.13.1794908400074;
        Tue, 17 Nov 2026 01:40:00 -0800 (PST)
Received: from [10.213.99.236] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cddc160bfabsm5299078a12.4.2026.11.17.01.39.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:39:59 -0800 (PST)
From: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 15:09:46 +0530
Subject: [PATCH v4 2/3] misc: fastrpc: drop the DSP-response reference on
 channel removal
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
Message-Id: <20261117-interrupted-invoke-v4-v4-2-2320a8a7eda2@oss.qualcomm.com>
References: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
In-Reply-To: <20261117-interrupted-invoke-v4-v4-0-2320a8a7eda2@oss.qualcomm.com>
To: Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
Cc: Anandu Krishnan E <anandu.e@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, stable@kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>,
        quic_bkumar@quicinc.com, quic_chennak@quicinc.com
X-Mailer: b4 0.15.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX3qQmEdGG7sMW
 DNsm2Xr+8VKE7/S8ViMZ8G/TDP67LLlRzulfGpsqBtVzTMGhaCzS5upBqQpAsP91Wubq5IVgLmX
 soA/tnKB6SZmlq6M9rDjGyIv+jIglU0=
X-Proofpoint-ORIG-GUID: GoJrPkA3VzG0L2x1iKQsOWJ3Kr9zwTXS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzOCBTYWx0ZWRfX+d9Ps/bI3u64
 DTiNa9RC5xxfxWI4tQy2i0UoYVlSeNVwj7uhayI3WILe8UCOYG85C7DKNWnjbn2P5IhGJQnqLvz
 f3+h7xa2lEEPg0GYRwAKTQX0elgVusmD0mBft+ZV9IGAb4NdNkp2D2cAC8p1UqShPTKp/rxWmIl
 RY6+H5llzOKYi37Fe7SyxR15vKSynLPnVrxB2oJ1Q8xgj6zgLLACYsxYZf8jaomhefPLjbiDBMg
 zTN2SGcbKK3PbYnHqL89dnYX/X3JYorkcDMQyifZFY6Mq9unwIfZ1vvKncfOBbgZXY6QkrtWjmu
 zOfQsUXs7YTmXfVyyPIsEmaLSbKvprT11+dmtK2TwGyb8VM0/mBDMb5y20UDrsLhOxNdD5eBd13
 7ORNQ5qxQwPf5sTzrzSQ4eY2DRKh3ewvlzQK+bJttVrMpustetkbXRjFM5zlXmnebFtqnslMQie
 Bm6wN2aNCuh2jI1AExA==
X-Proofpoint-GUID: GoJrPkA3VzG0L2x1iKQsOWJ3Kr9zwTXS
X-Authority-Analysis: v=2.4 cv=ZP1CCn7b c=1 sm=1 tr=0 ts=6afc20f1 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=lRMAZjgjxHAodmaZVVUA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 spamscore=0 bulkscore=0
 adultscore=0 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170038

fastrpc_invoke_send() takes a second reference on the invoke context
before calling rpmsg_send(), to be dropped later by whichever side
consumes the eventual DSP response: fastrpc_rpmsg_callback() for a
real reply, via schedule_work(&ctx->put_work).

fastrpc_notify_users(), called from fastrpc_rpmsg_remove() when the
rpmsg channel goes away (e.g. on subsystem restart), only completes
each pending context with -EPIPE so its waiter can return - it never
schedules the matching put. Since the channel is gone, no response
will ever arrive to trigger it through the normal callback path
either. Every context that was genuinely in flight (successfully
sent, not yet answered) at the time of an SSR therefore leaks that
second reference, and with it the context, its DMA maps, and the
reference it holds on fl and cctx.

Schedule the same put_work that a real response would have
triggered, exactly as fastrpc_rpmsg_callback() does. rpmsg guarantees
.callback and .remove are mutually exclusive for a given device, so
there is no concurrent real response that could race with this.

Fixes: c68cfb718c8f ("misc: fastrpc: Add support for context Invoke method")
Cc: stable@kernel.org
Signed-off-by: Anandu Krishnan E <anandu.e@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index bb0c304196..c5c3679f87 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -2835,6 +2835,13 @@ static void fastrpc_notify_users(struct fastrpc_user *user)
 	list_for_each_entry(ctx, &user->pending, node) {
 		ctx->retval = -EPIPE;
 		complete(&ctx->work);
+		/*
+		 * fastrpc_invoke_send() took a second reference for the
+		 * DSP response that will now never arrive since the
+		 * channel is gone; schedule the matching put the same
+		 * way a real response would via fastrpc_rpmsg_callback().
+		 */
+		schedule_work(&ctx->put_work);
 	}
 	spin_unlock(&user->lock);
 }

-- 
2.34.1

