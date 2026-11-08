Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111696;
	b=IJt+TiBA65be0n8T1ZLmOeWFCMKOL7F+CFPFM2uYvyrGtfj3U8j8qz1VqsKvp+r2qBda
	 E3JBF+S0tgkvRwrfhgYa3QP+etOpD+N5zmXTHOo106vNpGMR6wWoh/KYrbTn4dgvmgaTK
	 f9XkS7HcQHsN2iScBdtg8SELKXB3T5bhc2cLwf8LEQafCl9KFN1TVaHqeyNff0fSSOgD9
	 MexRYjJn1MdWowuwvRAtqdevvgCn1NCvIl2VZUxJHNDr+MxFVLoo8iuBczepOJC/XZwxf
	 4SztmR1rVzQPk6XWJ6v60I8iL6MwjAnRwFx4bNLZM5oOZr1c6sO05SIkZk+gaR3aOFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=;
	b=nRlQ3GMQZKI6hcb3M0DeoTMfPuvhqT6ck73hpR3d2H/LSI71BsBNeMB3nMykTDAZs47W
	 tTWI4JCobc8RAAREEXSkmPQqvNdUDPSqZk1Jz9dWuyClZb57knOOrkNxNqk/u6b8E+Hqi
	 6HNyPEgGnU0MFV5DYEzh2WYMMzh192XfV+PWqvtrfGjdW/WEUb0ymECEOj3c6JGEOP9mi
	 EGd/uLU4slt3RKHr0dEy+KyWwYkWvTMJRrcRDvQ9+AgD+c1tP8S3E6Gi9O0+c84AQxVf9
	 IJTUXgOwj0lf3G921uLyKrQLWuJQQIJQb9B+F4CzqtXvpeck9SjrkGzlibjTSnNrlsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="LGSsn/BV";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4XDaTig;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C127F606A322
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 04:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C127F606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LGSsn/BV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=h4XDaTig
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84KheT1095675
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 04:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=; b=LGSsn/BVOqsNMk5v
	vh8U8W10y1fkmzQrSnE19erTMrQkbfn2PqW0EZYXD2NHfk5vVNo00q0H03qHUoe9
	GTj2KhJhnybM2e2hRzSBecjyTe07XgAUjIXUZmUL8DU7WpMFUZOkzqZj29OYgldc
	RKE3DgvVFHwcVz9HPfeSn/tRkTPvRLnuoJKB5QmK3eUgO7mttWkGWMxbVd6H8rFx
	EGpm63UwRDnovtcL37ezEqtp2QjJsJIBFw0YBxyAKfzoX5GzLTfpedkSpNwn3VG2
	n9q2eQXdCo8WXTCpKvCUVL6zroOhUO4DPZzF1NGPnlltqk+gc/mqwb49mbA1z1XN
	rJ4nSw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsu06tdc0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 04:21:34 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so485267eec.1
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 20:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111694; x=1794716494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=;
        b=h4XDaTigRIH5DLO4uP8xJJj268p/vK3u4txhQTyydkhcqyk/MaGDdubTifw+BLgUqc
         fLVJAfhWDa9LNjJfEWLIdqKcNDxMXXRqbT3miCXfqo77B5a3eR94NWbXMB8Tjdm2Xp1u
         RY/Cz/1UBKnbjGI6CvL+SzTCE8thmdwfTjbcgTmTh5f3lQ0nwi84yeb1tKNzGzlqk3Nk
         G6tF5MgV7F0TRgKSsxkuqjc4L2ucyNDlnsfkktdzPpIEpF2BVXfw5c8RBw0AayPUlBAw
         z7TN6fQku0MF4skmMGA6pDJMjMFlvXLcQwnc9P8G/G42w36WsC5NKkgFVK2p9dO9/Ytq
         nSuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111694; x=1794716494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ISXzQ3m5yX6JkAdjbIV6JDw9hW3wdCmfEd3hj0fNJ5s=;
        b=SueBa75lC/zzu/d72LGiIbRK/NmXn7iRsFnkilSVLw/REXoGoBnZ1v+AG2UL3pXCgg
         1AOCPBCwZSsfDB/GdoGZm9l+OoC9h2afvuDwreFJWvvaNgZERnDAYkgewwRbk8GZBnt8
         ETRkSAwQBnxBZYkJDWB2bVYGMahNnug6HGqXMP6PkVHilcL71nHA5xlntuYqk+quWsiK
         dVSCfq/8kKJR3YsIKHEeRpGYhibl+C0X07nLcwMAFtsYnA+49rZH5nVI+o3b5UzXBdcK
         p7aJZ2Bo99jLmM4y+RqfMmU0YbMrFI7R+WY+aZserAZdK7emZW0kQiyBgD028Q5lJzua
         xyYg==
X-Forwarded-Encrypted: i=1; AL+hErEVzKAuwz7MxsCEJcWkARwnHK97Jh3qiTwkNMSDJ6aVvI0k/oHtPr6CnsbpRtddgY63go5CJyiE+mAW53Xy@vger.kernel.org
X-Gm-Message-State: APuU4Z8OrbdC0kXcUY1SFzwU5zX9q+V+JN033LMrOF70y25+popEu/sM
	3ftUio5HWvHA7k2evKZg6bsJrEsB4wZC8RQFz6hN8YxyhNhv0yQidquti5dhXYN0wJgHBvRsMtF
	qSf9RGErNlDTrYja5ESyuGJUFhUrwpVPFcfd3VNXZq75r6laXa5RKic6uEIi5r/brv5sG
X-Gm-Gg: AYBFou1cINXnuPynEq0NGLGjA5fX5fZ9nqPBDYQzcgKVbCRIkGW+OMTnNGml2/FUYyH
	1wKfdStLVo+jsObsPVnmlM0/ndw53ep2QbHIoLCLF1ONySchcAvkw626oAGPXiY5Wn/LsAqB6YS
	zT6L85D8AJ4x873tDME7TN/wy6C4rwuLMiaITXehUsZOhkkT1szaSYC9U6+ucaYG48mGZYPCraU
	4ITpG8UEA3dFs/ReLIgOvy7UM4TCa+8pWIXjnhidcHjXSF+QEQkD9vXPXfKiWdYk79jsSFraBjX
	iIWdKiGIOXlRioN+VGnhN5zb6oV9ALV8b7aBTmt/saZTspDJS+LQI5gLEYVSj0dFC1M9yMzp4VD
	Cc3TU8GWClMcO5PsY6jBROovLLEsSTCbsk88As5fm7Cs5vqXJUapO6CzQUSqUYqBRXeoosCyKCB
	+x3uDKrVLn1lJdjtw=
X-Received: by 2002:a05:7301:926:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37256611ebemr1426115eec.12.1794111693530;
        Sat, 07 Nov 2026 20:21:33 -0800 (PST)
X-Received: by 2002:a05:7301:926:b0:36e:c85c:3bbc with SMTP id 5a478bee46e88-37256611ebemr1426090eec.12.1794111692992;
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:32 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:02 +0000
Subject: [PATCH 1/4] checkpatch: don't stop at the first clean patch with
 --mailback
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-1-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1208;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=1+3bOJQ1GB32Ffh+hTHyqk3ZyzZmdNbrSRXFG15qzME=;
 b=uDZKu/t+XrUQOoO+rojExqXQuntW+ZzKWCpcszNKlaIqarsZs9MjYn9USphohJ9aM/YkmFaQm
 llGpf44JK2HDUSf4TiXEdRSZdUCj5pNaBT7GQy+DTk71Ju/IF3cyApp
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX+vGJ1rsFA89V
 g3PsB+vuHuIY2aUQOAl8AL6wpTiDC/LhGqDW+VMrvQcjuDjFk6iC7W7hggyiZhhpDR2R7dUSL05
 VaTxPFsfOfveQgzJb0DJ0iPMbPP/vrmhkze2bDuH+J+ptjtGvCwT3Qj0iBkODFVrbcKVEkW+Pps
 f8JT3RWA/gOar1nnvh/CW+XMF0eIz1BLCazR0sk6U0D4kIpSsDdA9plubGT2RVh51edMauh49li
 5BOpWEraF+TSHT1Uam77RcbBdyJpZXfC4WzTL/HNRy9lTUGqUXM7+lQubO2U0wS8hh//XtydTyj
 SFJuRtPcCUrXUaM/n+IdwxC8LHI7f/9uohhE29ILXtuHaj/tDRhIGcOuHqpO71XoHgARCCjtceo
 HNsE3TYbW7dN0r1uaUIe9+jvGIFCgCFE/h+NlCbVqWXEkWoD2BVeRMd0wx8I5bdmk3AMHtr3XPA
 kKjIRVPum3pGDSkUH2Q==
X-Proofpoint-GUID: kYIlvlPo_DHBElA-JWJjlx1qoZtXXFYl
X-Authority-Analysis: v=2.4 cv=IJGXmQvG c=1 sm=1 tr=0 ts=6aeff8ce cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=mvJOUf6hComDGSipof4A:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: kYIlvlPo_DHBElA-JWJjlx1qoZtXXFYl
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfXzhoaKgs23vbe
 yhjxGDkbmfPK1Al6wY8k0aJ8BM8vo3e5HswAEoYVulM7pjtH5tgOU/oXef4WulA1+HC39aKlccx
 AcGzODHAC9iBNo1hGgWl8KLVojLXq0Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When checkpatch is given multiple patches, either as several files or
as a --git range, --mailback causes process() to call exit(0) as soon
as it encounters a clean patch. The remaining patches are never
checked, and the run is reported as successful even if later patches
contain errors or warnings.

E.g. with a clean patch followed by a patch with a bogus Fixes: tag:

  $ ./scripts/checkpatch.pl -q --terse --mailback clean.patch bad.patch
  $ echo $?
  0

Return from process() instead, so the clean patch is still silently
accepted while the remaining patches are checked.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 741b189d5e01..e84bb4c12eb4 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7880,7 +7880,7 @@ sub process {
 	# In mailback mode only produce a report in the negative, for
 	# things that appear to be patches.
 	if ($mailback && ($clean == 1 || !$is_patch)) {
-		exit(0);
+		return 1;
 	}
 
 	# This is not a patch, and we are in 'no-patch' mode so

-- 
2.55.0

