Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538877;
	b=cVzJ+IjtDXHHypq6Us6TGrzwAcZnhnXU4Y53vEEuKj525Hzy+2dge8RcLiBT2TBsIVa1
	 P6Il0+pivO32tJxjtelYHKzCJYGYGojgn6s/I0680brwcPd5FqD2B6Kv/AtdnWqCEWFtA
	 UsOMLbwePr4dUIrvwbj2UQOs8zNvtOWoAPMB9BPSNuiLesoEUlmP/hlhU7AINsVB80khZ
	 7Xha9bpMxkYddwsMEltfaRI21XhwvHKX61VPodxYS4YDefvQ6vZBJgTuWfji2rhlE7Ydo
	 6iLgXClDxgFIc4zd7OKsnm152jzux7j3PzXWZ8vcBYTj4EMici0SuA2Lp0HbERc0myA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538877;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
	b=zgkzXmLnLgRlafR/esDMdWedKJHiW/JPAg1mbbtR2r88RCFn2GM8tv14SV7nSvf4DKr7
	 87brIW6zmXXJ5rXjbUxno3/dwd12laWv0wojY+rp7dkX8M92N12DzUIxENFs7tG8uAOt6
	 aHxzGffTjpUacm4iFVDxFq7NApHo6+slPQWhxkHoBQcNLOC8fyLSC1Ivhiszin7ke4cDz
	 e9VzszWbawIoaKz24gWgUnjkGUPfCB5tlvNur9mhs11ACBSZk04cQ5ZNhKqojtbgpylGD
	 EDAIbA2GEL68TxRcRLiYDIwRWYJxr6Uy43f97yjHlVM07QFoHn2lwpkNV/PnKS+eRwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajAFrMyP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGvBdCX8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72D6A60A260D
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:47:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 72D6A60A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ajAFrMyP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGvBdCX8
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFLA1n3878580
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=; b=ajAFrMyPNlaEgKEs
	FbBFJU9wYgC9rU28HFwSZXQHanhbLP2V52NAvrQABxoeZsOyy0WhZ8pch7B1u7qA
	9+BcHP0WZyNWeonLemVPJTxWQtXYUpbYVDXZ3y5Y/7SyBhKCqmIzaKwyjhq2AJHN
	DKJs4Z7ItctQIcS/C0JdAfdqVUk/roCG4dKGkdushf9vm31kkBaf1KJ7/obflFJW
	G+q7UjsPpvRZcIXl2qrtmvkFruaR5LosaatO3RIOj4doK1Pge7FZ9PAcrEf8NzTS
	wsyZaKE+aC/Iy7M4fIdldM6234Y/LINZfG44GcQhUx4IRKTQ/j5HY1yI+f5pNpG9
	Q1oOQQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yy13wxu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 16:47:46 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94975041698so1256011785a.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 24 Nov 2026 08:47:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795538866; x=1796143666; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
        b=gGvBdCX8Oct/h46E9pQ6BpK5VPOctDPPmcpeec24S1Tq30qKAUH8WpNS0KZO2XjGFQ
         xw7rUkzlS+agBQrzx+vJvw1Zfl8N+/qsqaDqKDsHNkQzlT9q4fDmvD7eyRyWMArPy48f
         TgeBuTWp3s3BZwIQauk8NJfEuEJ3VCwO/QTx0EJgiPuiYQQ+8PkOo7syUPd6jjGe1wpV
         uthU9bJ+dj/Y4oGR3BAsvggIkaJGCAL9GlzZTi9HePgOswuDpeMjmG8zYvjd6XKz1tJU
         Sj33R08h+mTQ/CWals4GakHTx2Puc1uiz48wwOUExHEtOU79pW1Q1hRW+ObZOszfz3Cc
         acLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795538866; x=1796143666;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KRqdx6jqRm+c0HwTJepA2KEMZ6p8DecuJ/3DCQP8dRE=;
        b=wsaRJm9eXbx5YPBa6wYfMuzq0UJ+iUkXrbLyVdno6YnIaxGa8htrXc6kyM61mjid8C
         JqSIBhsPxmCZ9hwbXKb+GmwfVnJh1nKOnVWqy9rBHpVr/r41jQrTgURH0ZRM+ga8hzdH
         fgWHnYgxpnlYv8l7ABLI9DxjWAp/N4WBikhYKBDsk1le3ifXi31RruSb0DblMumEKbzp
         sib8ae0Zp1Qu6Txn63jBn2D5vtubhDNAK4AV0WseX4R0/UdqskSjEF9M1WmL8QhIB8kY
         RPyf5vRqQqvQ/mWHvwz+jR+QiRpHez6kK1ehJ/MWTx4Rx8XP2OP4d7jvZXqQwDPKDKKm
         l8gg==
X-Forwarded-Encrypted: i=1; AL+hErHIn/bTs9skYEKK62PukU6nn7F2DyDlHo+NSV9Sien8cNweSUQzmxqxoZr3sniDWSstb/G8YEKyyoiQA2ZT@vger.kernel.org
X-Gm-Message-State: APuU4Z+2cBSZzF+AmxViNyoSWSs3J8KXh+TU6SxABAyfslka2Add1egD
	uPPUjhsUKwIW0QFVrdbeAbQitaQ5fz/H4aOIo0NctZCrBzBvGhV5OkhW3IzG3soQPAaSSWP2Lqj
	UMpJlQgR+R0JEiiF7vmoiCppq+//9duT8RqrBeVFLc2MNEIxhotERtiLKaF4bMWSQRKlZ
X-Gm-Gg: AZFdTZfx8aLdUCQ9gW8YsiODLximAMX3ph/5exqOpOEx3HGZzsJfFhYggvhMeuSHq1e
	/BE5R6CcbWWDVfTGBrsJUA3vOYBG1BzI7Vln1NmPvNB2iSoY7c8gK/Wuq+0uL4L378DhPJ49tYd
	B9qqOlBhMkHzQXE3QOHeVFzDE0lTw/u8NmRM6IMSsFaK+aWQXsUTbeHjhSnfTlOl7SslTyr28Tu
	IxLCuuKCefaIif0UXp+vc/Y3G713w2iGR8VV5f7CU06jl3j8u/vF4JW2fInURTCoCKjdBL/bVpI
	afqYM/yST1ksrkua0Z4McqLHVqgkScmm/My3XrQM4dmPAGir+9RY3BPCJvpPCOoI5LkQbe7EB1d
	hFKE4c7xTHdhzhX1SNNd7Nij5JBTyNGHCaXG1DiMTv3/udSGqPhGhXRI/bNhRZcyYDmxbGb3X/i
	WLAnpfZSwr6bfel+pgsXUTHyM4G6cIbvyvFWjiyFl84zTFeHWMybCHlDOqRGG2dFZaB6IVLiq0c
	m3az8ZCSUUHYB1LvmArcVuJrRof
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2873313285a.29.1795538865646;
        Tue, 24 Nov 2026 08:47:45 -0800 (PST)
X-Received: by 2002:a05:620a:258b:b0:93e:6e6a:b686 with SMTP id af79cd13be357-949b36034f8mr2873308485a.29.1795538865223;
        Tue, 24 Nov 2026 08:47:45 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm29388605f8f.5.2026.11.24.08.47.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 08:47:44 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 17:47:39 +0100
Subject: [PATCH 2/2] media: qcom: camss: vfe-340: Skip the register update
 when queuing a buffer
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
Message-Id: <20261124-tfe-fix-irq-v1-2-fd9840d952ae@oss.qualcomm.com>
References: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
In-Reply-To: <20261124-tfe-fix-irq-v1-0-fd9840d952ae@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: I5qS8vJ6QZCsTcdv_nxmfLnfn54r1XK3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX+Aa5UJwlQs/+
 2+8dgSVhJSoHyswSMhdTW0yFAZchKjBnbzfamE6ssOPZIlYW8918LvAS1KHlo3tjkrsTRzDYUWy
 jhQkd7kMunPmx3s3/3nUSsdQnrBvO2U=
X-Authority-Analysis: v=2.4 cv=JYspPkKV c=1 sm=1 tr=0 ts=6b05bfb2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6k50daf3fveMbYCwvhsA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX5uBsOcAURVFY
 BHUu89tsoTd8iMzthvlk4/VMv+BcTwl4O6tNBJB34esD7WfdYBtHL2gQCpCmeU9IXtLQgO+3mQq
 NJ0uGgTbw6R4+3CYiM0zrhVo/1RYTvezZyqiiUnN+YW/7D3tNkt7+ouKbKtBiUuILFKnikHwI+L
 R0KMOMRXWv17W13v2FPw4oe5codZ2ZqHPpMN9VFMbo4UF8QnEn9/ZP4rQyLohOhAITEqvB1vxRz
 mWH14SVckedPwUEBICE0eZjfu5gP6KXd27LYu9uS1JumQRynfHMN3u26pwridmyzPzl79mSzgtt
 NDRgOM1kVWNEBLVRu/+edaZE7iKW2ryKMJMXZS9wRegW4HgaYujpR656zzVP5EOl1mqQqviSNM7
 DDbaxV0Mg6GlWZkfuLH4HgYCFTNqPBiM7eLq6hVLfuerEtlNy+BESty/r9KkihANS6Duapmx8ve
 FMcvgCPpacgUwSYWg+g==
X-Proofpoint-GUID: I5qS8vJ6QZCsTcdv_nxmfLnfn54r1XK3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

The TFE bus image address register is a FIFO, not a shadow register, an
address pushed by vfe_wm_update() is picked up by the hardware on its
own, with no register update needed to latch it.

The register update issued for every queued buffer therefore costs an
extra RUP_DONE interrupt on top of the BUF_DONE one, for no effect.

Implement addr_update() as a no-op so that vfe_buf_addr_latch() stops
falling back to reg_update() for this generation. The register update
done at stream-on is unaffected, and streaming now takes a single
interrupt per frame.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss-vfe-340.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-vfe-340.c b/drivers/media/platform/qcom/camss/camss-vfe-340.c
index 2526d568686db06a233f0aabe4bc176e4c440ea5..e6f863d8f38d0a7f1e8fba431dff2d8583eb2cba 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe-340.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe-340.c
@@ -365,7 +365,13 @@ static void vfe_reg_update_clear(struct vfe_device *vfe, enum vfe_line_id line_i
 	vfe->reg_update &= ~BIT(__line_to_iface(line_id));
 }
 
+static void vfe_addr_update(struct vfe_device *vfe, enum vfe_line_id line_id)
+{
+	/* Nothing to do, the address register is a FIFO so vfe_wm_update() is enough */
+}
+
 const struct vfe_hw_ops vfe_ops_340 = {
+	.addr_update = vfe_addr_update,
 	.global_reset = vfe_global_reset,
 	.hw_version = vfe_hw_version,
 	.isr = vfe_isr,

-- 
2.34.1

