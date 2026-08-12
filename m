Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3980B366067
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 20:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786564896; cv=none; b=tf6pqZESKLuJGdbVCrGyhCkFKVfLgI1jgFzTnJ8XiLgHmaH2f+eFQue2APOWRgwDLkWQXPEt0nHqwu8Ze9PMReTdy08SDA+V6kfcG268Y/Z+VIPyDOaQYkfN2bxo1K8oCL8IsCzXcGF1LM99DrhCNYeRA7LTtvUnK8yccAThd6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786564896; c=relaxed/simple;
	bh=Srv7YZwRGZt3x26M6QPq4Hp84wa5hDmKkBrQtVxPXa8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XaH0firX+USXHDzgSinTWBnNdu5UeU/OCuDuz2JhIKVDQGRQgRWNvxY34v5hFAiZsALx5qCaEDEiDUkYe1jb8yep9MQ29xMBk95NJi8ESnOZ5sO2zkvH1Eh71kV8cpv0pNP5fsWCSzXuJFDepeKnjW2jL2X5CMFXw0SGy07Fu+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QkJi4OrW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YVz1Lw57; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QkJi4OrW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YVz1Lw57"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CI8gaD918289
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 20:01:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Diq1tG25o0LV+02xuOMc5mc02Aof/vsh4RWwsT6di8s=; b=QkJi4OrW9Rvu7e5D
	OGEfkYEXMiWReMJdvkyWyd8c/C2mZUJIKAwOpSYIJTQ7sVALhevGFaYR7yX1tVF/
	92PsTzQbKdfkc9YnvKNw3lVPdzT/jnA1oO8NQBusOFN5YB6S7CGO0IMRMmr86Ctd
	VKWJg7lAhAdZqg858KhSLiQm3npKbCEKpf9NWz0wNiprl1ABmQd//G4aMhVRy2tQ
	lakLSsQBCEuWdKesLDLhKoaJRX8ZHAxJ6M7Uf2/hXn00DOLkP9TTbZsFR0Bq4A5w
	dP4vca7BzxA3BorlDt1ilCreSt9IwGaCYDuOO/r6P/rWFRl7TWlgiq4ei/KaQgHj
	KBvTIw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0sk41xmu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 20:01:34 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-526da7e3c9dso13557121cf.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 12 Aug 2026 13:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786564893; x=1787169693; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Diq1tG25o0LV+02xuOMc5mc02Aof/vsh4RWwsT6di8s=;
        b=YVz1Lw574kOUUHOM8hMP7NrZHLngaepk4/3qkJeKWk3cc6iDAPDmSMdVQCNPQyUBEt
         gqtTsY4hDCFpAQqiZda/LV49XS7M7y/crxApHJIdllbU+bcx0klbvStT55fRSAYmQHb0
         KVK55j0610jnCgS7A/vPFaxyzoh9sCU9NX+USyy7YzxbGHr+Q4mrn/UisXVqNRiLYySN
         NlWEYFTkZqZIz5d0wznBdd+05YXwtl88v2lkC2enHdGpiqyXM9N+ce6NZdsmQ9ZxGjkp
         svSAVITwlDZV1oUrcrvZk5x5QwdlzGXOK9MBffd8nPYhyKpn8RWfzEoZqlN/U5Id7jUw
         gUXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786564893; x=1787169693;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Diq1tG25o0LV+02xuOMc5mc02Aof/vsh4RWwsT6di8s=;
        b=NcHi0aAHWPbujjJZ5CB7PI3ji9Afc9nNSbsvOnmMDjp5v460CE4ydOxuJRnBCjciVX
         F5DGc0HVqYVbrupi6/NUk9BMeeSYZ7RHz/LdwwOSrq3XZ8Wd4Za4DevwNuhLLnkZMIBe
         z9FuiAmz5Ij96TFLmTVo/Axz+ih6c0wDx3jr5A+VL1C+1NP/PybFciDpTkUEtDq4qe3S
         +iUbInlJv0F3Z2WZ2pEiXLj+s1uP/5hWZh0xmBE1RHVSsiaCjOwvhjdirXUDWt66uTla
         reKc167QmGAVuCHegUzWibPU/lskFDUgqjQ3sY8m0VZcUOAps5ptcgtKyOvrMjOs2QCe
         GDAg==
X-Forwarded-Encrypted: i=1; AHgh+Rp4G8oZ0TDuLvMpa5UFbdPuBrsSxyz+tnOEDYXfle2M189DY9GTmNaKn3RRbXay+ap46qAnTwcyBADnmyKm@vger.kernel.org
X-Gm-Message-State: AOJu0YwnOMn5bsnyuMgG3ZL3Y2AuL13y/+WHpu7qw3AuNkqteUN3N9ZV
	+SgtuwmLCxsQVos7zcim5ZMG1SBwQSwz4JemNEw4ysmBhW30mAY0Bhy7m4R+/XyrfUg60FEvvFv
	Y0xmCBRlvHK4P/1EdGwdJbC/9E9jKpiTXtJH8LG4yDLt8sdGxloYMS+WEyIZDqEY4Dt3D
X-Gm-Gg: AR+sD10AGONjan5LRdCYTFJuPTfaKtzpL3kbCn6GSza7eQDPI5GT8AEdqO2FsTesBA8
	NzqUs6kiJbmcaRhamz1hIDGwa6oWnuZsDA4GgzCxtUcthXMM/zCZ4e5cmzt3SI26KEiOOtdciDn
	TxwTQzvLO25LDA83lS7Taej+K8k3wTQEPh89vw5f/s915RNDe4HpBp+0MPgFT56+R9/MiGKTUpr
	71tQ1BkpMerfdWayldbZV8qxsS7aexC8LW4ehpLklyxamizn5ACW9qAwn/pvGTUGRGI8Y8X8obR
	uLh/n6NdgcIOH77tqajssJ1LaD3LuZOEG8HvbEvedmnmTB9bRXrSBtcA8tAc5PaHmLro7G1+zLw
	MChXm6LImMfXGH1PifeE/4EXjooNyqsjKiGh/v2dQRdVkkv4JEvbJKMePFccSkRpbTHycpK4dO1
	W3E5GhLLqIl665
X-Received: by 2002:a05:622a:2506:b0:51c:52a:8e70 with SMTP id d75a77b69052e-52d73c274b6mr8195491cf.2.1786564893209;
        Wed, 12 Aug 2026 13:01:33 -0700 (PDT)
X-Received: by 2002:a05:622a:2506:b0:51c:52a:8e70 with SMTP id d75a77b69052e-52d73c274b6mr8193411cf.2.1786564892161;
        Wed, 12 Aug 2026 13:01:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a11b2acb0fsm354561fa.12.2026.08.12.13.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 13:01:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 23:01:23 +0300
Subject: [PATCH 1/3] media: venus: hfi_parser: account for all capabilities
 when skipping a property
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260812-venus-8996-v1-1-6615f82a63b8@oss.qualcomm.com>
References: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
In-Reply-To: <20260812-venus-8996-v1-0-6615f82a63b8@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>, Tomasz Figa <tfiga@chromium.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2126;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Srv7YZwRGZt3x26M6QPq4Hp84wa5hDmKkBrQtVxPXa8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqfNEWqA3ie8cFiAO1nWypjTLI4TmhEdKGHed/Q
 3uVr81Y3SWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanzRFgAKCRCLPIo+Aiko
 1W4ZCACD/Qht2Hzl2eNlq5y+emPJoSGrOe2OtseIwvVh1pe762IpqRzANftw5A3/GYSf6wmEZAJ
 Rvn4nnRPZLnccr62udjtEO8NTZWhPE59Xzv/5/0kgPUsa5ZLEyfX6sLJ6iDjWdAEAENFFxJsEm+
 rQYYWSKxYmSLInjl9RxO6ROTLt+CViTsvOQojcoRjElioPK3hYO5ECeUUCDoP7fr09cRFxk/4my
 zLlLBLHEQyR9ie40B6dnhL69zyronnfc1dHzcBBoFD+ZjplWWtpBlQ+I5EQRFCQjy8pCFS9wPLF
 Pzli7Np0pTDgnVt8ChXD7tFFcoEypJZAcqy5UxTtT9F3Y+QH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: AAUsR0rLo6wIQafeiUeWumjfWsXTKsZP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX9eyjlflnRQ4M
 ECF247PAEhNdmA7OxkeRvnv+MfhGqzYflRhfqEsY/D5R8kmN4LJwze85mk7xJUePvQ50KsCB/6o
 QyRPkMpzSL3p9np561xku8Vw5X6xfdM7Gj7J6Xm9ORNHnr2q35a9yh9JfC0bNvWiXwKqfanTej1
 jQnxX5w2jIlSMbTN7mbGucImu4/6GROUOFp2ehQTzmwyVktAI+TILN2FgYmiM3bEvtCWJ+Fby4V
 z8YU1NmHZD2XhznVl3WUBg+m9sBFujkZY8gFOxm4eAnWlStqynajV/TTsFdbXenyv70G2bFTDFm
 OabPRUTQOVfp/RKVW1hjfQmD2Wxjq+4u0ZznOP5rXoY+pn8a9IPaQXhxbqGVcNcqCf5XKGmqkNA
 oHAoQ7eHXEXi2TvZC11nRj1Yi0Wl2oj2CUWLI78+HB0Fa28ip2U7ua7dvHWyOWEIukxun8Y3LTB
 c1bc/kwOudj2/Az55RA==
X-Authority-Analysis: v=2.4 cv=E8n9Y6dl c=1 sm=1 tr=0 ts=6a7cd11e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=cdMpqBep0YYzfnNq6hAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDE2MCBTYWx0ZWRfX8Uaed7cCGx65
 Wnw6it8EhxVdlPfTCzKQrdwOojSEVoiWdLnqpIjc607jhRjJSnIJKwRoCEKL9j8YK9MRdUrLJE0
 7cVcOHfCnV3cDp2gppw6SCeiVylxPAU=
X-Proofpoint-ORIG-GUID: AAUsR0rLo6wIQafeiUeWumjfWsXTKsZP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_05,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 clxscore=1015 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120160

hfi_parser() walks the property list of the message it is given by
advancing over each property by the length its handler returns.
parse_caps() returns a fixed sizeof(*caps), which only covers the
num_capabilities field and, at the time the code was written, the single
struct hfi_capability that struct hfi_capabilities then declared.  A
property carrying N capabilities is therefore under-skipped by N-1 entries,
and struct hfi_capabilities has since become a flexible array member, so
today the whole capability array is left behind.

The parser recovers from this because unrecognized words are skipped one at
a time and capability types, limits and step sizes do not collide with the
HFI property identifiers, but nothing guarantees that: any capability value
that happens to equal a property ID is parsed as a property, at an offset
that is not a property boundary.

Return the length the payload actually has.  Like the other handlers this
leaves the property identifier itself unaccounted for, so the walk resumes
on the last word of the payload rather than on the next property, and
relies on that word being skipped as unrecognized on the following
iteration.

Fixes: 09c2845e8fe4 ("[media] media: venus: hfi: add Host Firmware Interface (HFI)")
Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/hfi_parser.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/venus/hfi_parser.c b/drivers/media/platform/qcom/venus/hfi_parser.c
index b1657443f23f..3413b91b0b7e 100644
--- a/drivers/media/platform/qcom/venus/hfi_parser.c
+++ b/drivers/media/platform/qcom/venus/hfi_parser.c
@@ -146,7 +146,7 @@ parse_caps(struct venus_core *core, u32 codecs, u32 domain, void *data)
 	for_each_codec(core->caps, ARRAY_SIZE(core->caps), codecs, domain,
 		       fill_caps, caps_arr, num_caps);
 
-	return sizeof(*caps);
+	return struct_size(caps, data, num_caps);
 }
 
 static void fill_raw_fmts(struct hfi_plat_caps *cap, const void *fmts,

-- 
2.47.3

