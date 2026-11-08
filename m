Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111702;
	b=fNxu8kGXvTp3wOAodKSSUSx9BbOT6YdVJpmGOMs+t04F9wqo+aIRy2TWPN6Qkc5FDQdU
	 XSCeGSoNhjcSIMYhwRjIEq/owDy05vMj7JnNJppjMvBT9FFaw8yN8LS2db3mVlqaNNbA5
	 Chn5Iuu1Ld+bkMAJIncI66UxfI0funIdns8uNcgM6yZnvMajRrDR/OrLm2RLD8aS+9VPT
	 tJ0hIEaWuFRqHJuz4GM1QV0qOfQJS0f4opZ4z3nD6j5W4KngyhqeeSzph9Ac6h+sGxxyL
	 pS2ESu62imihdqpxyMXisyey8w+TMYozC8oEiNR2wDUJCdqRL5voA4OxALtSbz6ZgcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=;
	b=2y/qiGIHIN3xX8OHsTxv4NFD13obxzIaiLlm7mYXXhWSHAwtBVcKuiEJmg57Ie15EYTI
	 RS/NRbaAWyRsxbkqmX6rIDFYTCZHLxIHaznbSj97mdQ7xAvJEvh4ZeyYJEwA//Lc0EC/t
	 WdNC05F/wLs2BiaePglvjldJLmc5V0FZDTHuo+4VyWIhOe0q+H05fyP//ohcWr+mFE6vQ
	 W/mtjnedZs9Gp75K7r/Pv2vmkO7VFGxZT7BzVo2GVk9KQSF7xkjZtUTkgQezRGGaR4kIK
	 ht2jVkzOVQ7ZhDtlv0lVLD7LS5Ocgxy3Cm9X3g0jthczI8FJsVetif24IuCYzSf0M7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qkhtk7lf;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VT40Zlhi;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB14606D806
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 04:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3CB14606D806
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Qkhtk7lf;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VT40Zlhi
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84Laf13065158
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 04:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=; b=Qkhtk7lfNzxISWf9
	RBBlom3NNGODi8oD5CrP8RLzAqSP9TzfWLPoeGji5g7u6qXm99SXQRVC/W4V1HTY
	aRNQcFs3cfpJ5VzEe1WTPLe7U6b7ncz9Fki1U43gRh+zS+Z/qevS1Bqun0impdsj
	ANisxm6nn7xgHoReFDrI61EkzyC7suJQWR54qtZ8dtDuF0DTKd42aZapY4endU9S
	fG1zCzhwAJq7QhzAzQYZVrZyHnYkk3ZI4r8N44J9WXNAHkAs4zfxtgekv3YUudkM
	9FvH1BCgUkJurPGi4xSsMYUjmkBmGGoW/A3lfPu2gVWaOMX3D0no7k6tz+PGWaXy
	zjqybg==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsw5k23bt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 04:21:36 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36a3451ea93so301780eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 20:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111696; x=1794716496; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=;
        b=VT40ZlhibqpBkjkmGs0EaUD+0LFRwRJ7xfeT9rAiLwZHEbhtsJYSG3o1xAsHu1Xx4e
         Fdh6zgyyqjpCPrw+UDYLjalFATHGAt3ghj0eB5PQZzxhkNJ0UZd0HB43zhwSCLZOgFT8
         ah/V2LRknOps7LdbmnucU4HbAnyQ52UZkwna4exPPo5wLoa5+v95lbGjccenjO3pgdJn
         lqIxw6TNerhNiIf9m8PqIpwAir6dEWZkGxLRSEl4ZGCvtDl7jzBUEpKeLUfShWToVZbf
         4z1tjueZNz7Dw9X3JYj1F+VAPE5+vwbs9dw/iUW2IMgQB3HntYsVdqslyidjkOiweSSe
         Ts1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111696; x=1794716496;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8ZoSZt0lqkBVzUq7XUk3JrKE4V2NoLxbyZ9nttJfII=;
        b=ghHc31bSaW/qxT1GO9wxVnBUJC3Qg+5ndD6k9ccn1P1JN8DjLe02z0W9TxTrSSjlde
         NRhj5vo7sdiF9DkpM+5S+/B19kiC5QDKyUhAo0UJEEZTar8Qu7vvsYqUmAZtbOs0v6Q6
         H7PNHVOgqedNXc8TL9eAkDX23pQUmGtlLKmx2w9LqL6+uS3QdieDxstPzlQxEF9YhQVC
         TTJY9m0Ls7mXI/R4HsiEbl0GdruZmCxwzaTh8b0539ZgghpfEncvlcg392rHspgBEJ8k
         ylPdCMrEOVEloLdzca9d0hSfEIJ/ekTuBe1R1Hk6w1K00MBmKPdJeyT+gaArYIEyevaT
         T54Q==
X-Forwarded-Encrypted: i=1; AL+hErEsNDvBZ38+11amPv/m08rjNbK7tmiLjfywj4Fqp6FzqF8m7UrSpU3L2XXCBl4GgI1i435gOz/pi4WOO9Kb@vger.kernel.org
X-Gm-Message-State: APuU4Z+b23lBG+sAGQ7gzkUmf4AGUp3DEIS5GlJb4xAbt3RQzI4QRsXU
	mmsNNTVS6qL+ven/mnmNZHd5xWInhfC2w1/7tTQtaANZJXc87Wzbaew1CChu4X/fxamlTA/GjOB
	X+CcDzUy04Ha9qyQTANZ182W0FwSG9548ah1B26dElWskJVEW6KdmORWvdVPjw9wQV0nU
X-Gm-Gg: AYBFou1PJV1wdo9Ow98p8LBQpzPS84cbVzH90pUqePtzaCf1jHoI3YOhp8EnvswKDbZ
	f7p6WNX4+3Ad43faipc7bohGHh9rR1PZveN/PcV+D2wVaY7FKwEGpeXN0wa1Yg3xK+4gxj2VPoE
	aANd4AQ/m6049L63Dbxsa+yT+RlMjk+f/dW0dRgClS1vXvyuW253zTMr3yNcxxU0K5TUYF6Z0X+
	SdFgv4JVJJWp4e4WOxV6zfaoMpjC9Dwpw0Vp8nnF3u6cvIF000GvkFhlS2rCkVBG8Jx8n7S8x6v
	aMKYEuxJmhQ1RndEfi5D5Hpz2C9ppquKtz1UwxfXzV9jqdg/z3ZX+Hx9l25K2C7rddx74E2J958
	ojqsjdgdOInQdNpUzvJeJ2ioC7KAvdQMoiMWSIyY8U+pMyLgRq53Yk97Rch8nfUnRxO/BKHW0HN
	23f7VBg8wcBuk7Y/4=
X-Received: by 2002:a05:7300:f3c1:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-372573d2450mr1351772eec.8.1794111695905;
        Sat, 07 Nov 2026 20:21:35 -0800 (PST)
X-Received: by 2002:a05:7300:f3c1:b0:369:faa2:1fb2 with SMTP id 5a478bee46e88-372573d2450mr1351729eec.8.1794111695274;
        Sat, 07 Nov 2026 20:21:35 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:05 +0000
Subject: [PATCH 4/4] checkpatch: fail on missing or unreadable files with
 --file
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-4-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1671;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=WjuA+rWxnDqdMTGidMuPJjXXyV9lGUwb1ZZ7lT0N8MQ=;
 b=6P9vY/C7figavLL58AQly7Vu0g//+VuVKL1pBXliXh/9FIysI8R355bDcoAWwcGC39SVQhcnI
 d4JLsuceFqpBtaO+p40WHMvNvpshQrECtRjdmSGUC41Axr/wLWw0uZh
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX/TpoLfTLstUt
 /iGSj05eP1RMUcXJ791d9I/VRJRrXXq8TU+0cblmbM8u6ygmdrk97u5iXwy+NbKFue0WWYydaKE
 r+ttmF3keub0RrIth8+SZNl9+uOmt9Y4b08Ai8YBSIVq7Dxv+tRvVV7lklYj2IV5v2iziBItEZa
 ty4OWi8Il4t0LjJzNNcXJ6JzSXRkYGVWBVchAg7xO7vGrG6NGmeEzkwETI3OaSYZay3T0fh4gVd
 BmyOei3T5SsshjiDR52QKifn8ye3YH7vq+CwjRXQeJDSizj4XlvhCsWCx8VgrpHa0m2osjroas0
 2ev5cNKno5x0wq7Zxr/MYl1bAam+/WvZenWivRz5biRtWSbE+4tsziX6nwiJuA8NGOhV7SLRiuT
 hLrEgGhdFo1hED1X+d65mifXKT8ELV3m6rOPk++itVGryyxxDvINE6V9mBwms+QyRy57psDLtHs
 FHwJMurDnXx3ZGneVDA==
X-Proofpoint-ORIG-GUID: I7vio5j2jDiTZ6P1mC6cSQvckZiJfe5v
X-Proofpoint-GUID: I7vio5j2jDiTZ6P1mC6cSQvckZiJfe5v
X-Authority-Analysis: v=2.4 cv=G/aJgNk5 c=1 sm=1 tr=0 ts=6aeff8d0 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=RHOWdOG5o7yI-h6IEfwA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX6H6DpBzGC4Lb
 lSZ5CsL0xBJBviyzf3nlAIbuBz3zqpsZ28Twsf5X2N4cqCyUT5LjOKMeFTlp62XziVW1mt6E3Am
 tQO8+HDn4smy5BzPVifulxyL1FiCH08=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015
 bulkscore=0 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

With --file, checkpatch reads each input through "diff -u /dev/null"
and doesn't check whether diff managed to read the file. A file that
doesn't exist or can't be read therefore produces no output and is
silently treated as an empty, and thereby clean, input. Only diff's
own error message hints at the problem, and the exit status reports
success:

  $ ./scripts/checkpatch.pl -q --terse -f missing.c
  diff: missing.c: No such file or directory
  $ echo $?
  0

This differs from patch mode, where an input that can't be opened is
treated as a fatal error.

Open the file before running diff, and fail in the same way as patch
mode does when that isn't possible:

  $ ./scripts/checkpatch.pl -q --terse -f missing.c
  ./scripts/checkpatch.pl: missing.c: open failed - No such file or directory

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index a5e6f96477c3..7233a19329f8 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -1346,6 +1346,12 @@ for my $filename (@ARGV) {
 		open($FILE, '-|', "git format-patch -M --stdout -1 $filename") ||
 			die "$P: $filename: git format-patch failed - $!\n";
 	} elsif ($file) {
+		# diff failing to read the file would look like an empty file
+		if ($filename ne '-') {
+			open(my $fh, '<', $filename) ||
+				die "$P: $filename: open failed - $!\n";
+			close($fh);
+		}
 		open($FILE, '-|', "diff -u /dev/null $filename") ||
 			die "$P: $filename: diff failed - $!\n";
 	} elsif ($filename eq '-') {

-- 
2.55.0

