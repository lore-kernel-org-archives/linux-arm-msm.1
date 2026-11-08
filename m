Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111702;
	b=O8tiq5KencoaAy7YGFkAHe+8RmRhB0Xm57P2WODA66z+6WUfr7aHsrt6gcbkP4P7wMq0
	 CYxEqzbJWR5MO+qX8gJJ47Su03r/E72LpCU3C1a/Ip4HmW+iXEMUFs4ZqGMNSalMw2R2z
	 o8WWtdgE7NvXHiPUECwfmH+YzEn1a9tF4+/vyaU4hA2aMcuenSUwu1X+A6rFzu2nQUd/Z
	 1WcKLbKR8sdAQZQB3HhVxJpdyB4F6ASqfaTcdnLzSFgRP70J81wWSFE9V2pfDk6ug1Ecc
	 926m59Q8VkmgQgErRLK50iAIH2KXzcaS8g2HblaeBg4cuTAxxsDd5bRK6GUOPqtg5Fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111702;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=;
	b=s68GCESFtA14twUcTwqB0/ilP3xyJwN+xijHgPxkhUyBvyKlcx0l0+/2QTiNUv0K1KHL
	 GrgfWxgPlDnwYRWgxVlj2vldcoMAXLSFggFFE8AtTxEPIdgBy2v+AdSVlpWNgkXC6jNNN
	 oSomZ0KJOv+ScGxe4n7QXWzbwdMsbuUArq29QxWtf7Dh0BNVPbAJj9B0RNp/2wJXC8Qtg
	 zK3yj68yiWFga87IHoLaSIDtHNrEv3UGFmrlCBJ2JmSm34acVx8ziM0g5SImmPh7iyGjO
	 yRlWxHrurY6sXPwBMtFz3N1YVySHzqfwst+sKbIIOKNdaWkUiDmuIpj7hQiRFPsz8Pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WR7KRgCM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLzT4GBn;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6CC606A333
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 04:21:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F6CC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WR7KRgCM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=eLzT4GBn
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84K3Ni1111117
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 04:21:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=; b=WR7KRgCMQ1vGtjEM
	jT3GoSmybBnRQ5p4Au4vmpdiRtg3URl8PlpCGllVmyyTi62OblUIhb2eSR0eIleo
	YuZhJlPac0Bc9if2Nl2JsE6qtQBzl9KY3R1WjIlnDRrH1yQwowFstD70vVKP6M3S
	u+p3cXU0puaQHqCmaFnOfmXJNUvBANDDcx0dw62SDlvWmZUDj2tksuMPZxhEjPOx
	4oZP8GCQ/Sw4/mbtdsXWWgl2VotT5YT/S90yKZ1UqCnQloMGHirZUTJtBoF/kxNN
	bGC2toOpTgxp64NvyENzqUX9DxvUcC2FSEQTsIgsXQzm5uWG1jVXXSVYnhk5SvLC
	HurYeA==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsujxaabk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 04:21:36 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-36f26e6abe9so384625eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 20:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111695; x=1794716495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=;
        b=eLzT4GBn8Xk11CeMNZnavqchOpK6w0E3DSznQes5WhxhRVw7GwB+mVL6y0dbGOxKfk
         SbMzQWvwNxXNXO8jPXqdvvpHH2Nh4Wp2W/DcISBeue8PbKyXDNsaNXyCKhHfYgpdqRNn
         IF/Jvy1EhxRAQDXdtj1biC2bSxUbpq3EIM7JacIJoWrGnolmweBfB1NCDb1mzXuqLREQ
         GEwRyO7qirDimKtZD04pnc2R8XIf6xUl0UIugf3ACyeIiF291lmiXm/EgXb2hBRRIizT
         cf8M9sCyQIuvobHBStD0M343Zh8AUBHnkvoSo5JUzOp24U7PIbDcS3EiPfvcmu6Z56Vl
         qs4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111695; x=1794716495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+bFhSi7HagmiSjTCIHbaqNkWkvzYs2Y96FhreGG8ws=;
        b=a1EEcKJdhPXL0LFi6bvCDj8nhijAoU7Xc9JYo1eVX4KDalk/a/oIe7khwMedAXwoYj
         vazDnKFC8rA47sJfPOPoe77ql4IxP+UQhqs+Z6BwBzate3mXSGhO+8oefue6BS+sqYrK
         Ga76Pq7Sc9zyLZ3q4Nn2Q4vk5nk6I6kE5yvyA+3vrjbFNWZQibDJ48xxVkW5fZHUq/8G
         U8ARvTOfJqBwX9oC2tHxFv0XrgrkvUFWEb0794Sfd+7LX3q3SSJk4MqqCKb9WT/Qoq3q
         OJUqgIdVmjTPC0BP2HiUuXCXeP85+XAO+CacWoi9K3v8sUqL2XqE7+U32xVAE90fqKBT
         mpSA==
X-Forwarded-Encrypted: i=1; AL+hErEUihsYHFzoorQB5RA+xDwZfCuOnzSuzA+wOy46bE/mUb0jDZK+T24sSmeIfNAnzuipWOgpCLHiDjPspdzb@vger.kernel.org
X-Gm-Message-State: APuU4Z9RcR1ra1+lvWzVQyyJVoljLb8hjyRIAvqhCN6l3saX+R4zQbBu
	kRtSXrkKOKIB9/vhkTNgKM13XZ2zUJxJb9aahVeJ9zQ1dy2O7NHcUtSirihdg5/bvqfO0DLREoW
	IcI5ka2S3mdPjH3qoQ4V4kvPEgp9KTFA6sI/v6h4jvywDyJJgPeHFr2yu4RN2Fe+Vf5BSoLwMoc
	zI
X-Gm-Gg: AYBFou3rEa34izY7Lk5tpd/qdhAxlXwQwgp90T5lolTFCnjem5S2Buz/IBi48FWgDMz
	M9liQHlFBuwMmO+R5iWCqGlXOoqDUE0My9PQAJhChmplbzQ1WTWEA10fTUfoMrPMQ8Flvjk+1Qw
	81S2m0bUre5II5/7byhBVVyxopJShXlUhzbsfsLpHC7fvOX9qsIB3MD+F9QUhEMPEagB+L8nBQe
	st3bXL5mbNOrGC0+T5bm/emBTI8bsMJRRa9SNUIZP9zI1yyuyNcMVQGUMUSwi4D26hOmrbmC/ND
	wrEQYM4XSsmPDXYHXhCZmy1bmjIvnwK5Sg1179meEblrRgEXB+J0Nmf28bnbCmWryiRnTHmSQTc
	Qox03B2z8iihRcxG2DXTAe6lSoX2LkhOtDqU2KtWxUsAd8SccDMSI6ObGwOQZszp0E+fgO22yaX
	epSduX/Wwbo3tz1sE=
X-Received: by 2002:a05:693c:6203:b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-372542bdfa1mr2338229eec.5.1794111695023;
        Sat, 07 Nov 2026 20:21:35 -0800 (PST)
X-Received: by 2002:a05:693c:6203:b0:36d:3c0f:cc85 with SMTP id 5a478bee46e88-372542bdfa1mr2338182eec.5.1794111694448;
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:04 +0000
Subject: [PATCH 3/4] checkpatch: don't stop at the first empty input
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-3-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1687;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=mS/9Ux416Z0wUAMB0V+cAtvRf90nIwDFh0mwT106UmE=;
 b=Wea7LOgo73uZNrXvbtGGJtbs0t1tjv/D5afZj9HKR0hGai2MRqEomjUc9dgMR19qI3Hzm2B5F
 vxMPIG4ssnABsZtvv/goLSB6EQkbBrCDN2cfZhPfAcqJWr6WFws9B92
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-GUID: C2OVfcAlr3nf0hLkulzhCKaisKhXCPnP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX0MdwhD18HJU6
 y2GAaCdIFd9KDSZPuS8wc0UApSMdxsO4gZh02zOU0N0o2G1lvJbyvOzSOpsZIgGZXYR5aNIeO+G
 mOdDztcw+Iu+ESLtOy9LwEDYPtWTuvW/wbLCxSLBX5qMQ48XYHopX++TPNw2yPvX/Mshu9Dw/lG
 nRRF8ZyYs4MgirtjRlLNRUOqR4xQFsG7z6UeDHJhHOMxAvg0zRwOiFY8W1/9qE/UOaOwPqhPIh/
 hNA+R2DCwVHoQw8RIgdLro94Z/68WJS4R3OgrIe9h/ABiD67gBQKhl+QBgH2WbxduH5BGbaBkYq
 2maCwyoLiIu7T7eb/sKYXqVrX45YkMKC5ZE4Vd5OvICsUsfY6XjB7QfUdrA87rFThR5ZvQusx22
 KqtWSY6Vnu+pQYWn10ma9a6bROoe9nEYVNEv4Coq0vl2SjETRGBXJRI0eRDU6uvaTozIE1jkKYd
 J3tiHcwfjV2JtrlC6XA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX1dP3gt3A7LRp
 lvLqtcIeZbFiGIPtBUAKY/JBi4vcC5Bdlc4nCjYgKB6A6BoUeSngaVp3seKAD3lSLjng75a4mb5
 QI1EUzhfUKRUL/jMsRVy5QJuR5jG30E=
X-Authority-Analysis: v=2.4 cv=TeIDJhQh c=1 sm=1 tr=0 ts=6aeff8d0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=CI0VfwZ_tOL6j5oRxvMA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: C2OVfcAlr3nf0hLkulzhCKaisKhXCPnP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When checkpatch is given multiple inputs, process() calls exit(0) as
soon as it encounters an empty one. This discards the failure status
of inputs already checked, and the remaining inputs are never checked.

E.g. a patch with a bogus Fixes: tag followed by an empty file reports
the warning, but the run is still reported as successful:

  $ ./scripts/checkpatch.pl -q --terse bad.patch empty.patch
  bad.patch:9: WARNING: Unknown commit id '6393a36fe184', ...
  total: 0 errors, 1 warnings, 7 lines checked
  $ echo $?
  0

With the order reversed, bad.patch is never checked at all.

The same happens with --file when one of the files doesn't exist, as
the diff against /dev/null then produces no output. A mistyped file
name therefore causes all following files to be silently skipped:

  $ ./scripts/checkpatch.pl -q --terse -f missing.c existing.c
  diff: missing.c: No such file or directory
  $ echo $?
  0

Return from process() instead, so the empty input is still silently
skipped while the remaining inputs are checked and the exit status
reflects all of them.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 45279c17f70a..a5e6f96477c3 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7874,7 +7874,7 @@ sub process {
 	# If we have no input at all, then there is nothing to report on
 	# so just keep quiet.
 	if ($#rawlines == -1) {
-		exit(0);
+		return 1;
 	}
 
 	# In mailback mode only produce a report in the negative, for

-- 
2.55.0

