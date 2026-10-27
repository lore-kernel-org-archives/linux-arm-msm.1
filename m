Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793104525;
	b=aUHFaDkxTGrJm9ohK4riesdoVR02aXH3AtIfbsQECGiUdGd9pHmGpYhYFsxJ4THAahOR
	 KcHsKP56cxmauTdgP74n2U7n3+VZt4mJOHYNDHbk0NSwbbVzDc8cVIMU/xoWhgqaZasVW
	 qKu1bpjnw0HlckkEorfO7mUn0t3R2QlBomH8w3N2RPiHN4Utu/2hHJVEME58TC7v3AJBs
	 ZkyIQD0HAl5b+EUHq252F9V5z9HvHGBhCgRssbyCk6nrHSybsMgyP6R5ehsz0wn2gtF6X
	 qR20XXHzz/0DmaxhGGb7Lu7pWv6D7yNKnWsMBBzyius04LlvnNrIJP1vVayMDggZ3ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793104525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
	b=aN3oA2SUcZlKUdAAUzqrUDGo4DHHYzFCrqZD1tgBmgPs7mqYZ/Rcc48qqicOKcd7R8MA
	 g0iQdRlr1mE3gjbi9xo6N4S5Lcli67MNfoSD0GvZSO1Krx05phkYRd50+gPwFKtcbdC8e
	 UEbZ5rmpSueSja/eCRLzPFTElTtVwQA3wRBfypiNpcMr4WPJaYtxZmZUGyI/25e5MW/FF
	 iFRtZYFc/mFLure+rYtKHVsa4KTWH3//SZl0TO8PWDdgcx4v4BY0j9A/y2X44SnNfc5/t
	 1d7uKSIzvMdVgijzw1wPpSbULsJuhXadfSu1z0P2Tq5E1xu7/5C7FarOkDqLevqXokw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSARHC9p;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDN7sIEj;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D23AB606A324
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D23AB606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=kSARHC9p;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PDN7sIEj
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RAe3PK1935863
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:35:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=; b=kSARHC9pIv7rT6Qc
	DNQ0xudpnbuLzyp33PUPFKhNGszS10J8MMb5fi2QCCl1k9OZn0l49F/KFJqFbE9L
	xc6QWikzNWBwC/SF0MTO9Z1Mz19aYiQyVlaSrx9l8S29RKzRdJApyxQQkvO3EgB8
	k9b1fzhaoYV2kOHkW2HDEvRJRkY6LuaT8GW7rK9A5bIrR7lg5yB5ik9OSgfDKnie
	BYrJZ16f98cCcur2bhXsGKAnANxEv1HF3fFEYfSri51fGPAP7LbZyqWQats0aSo9
	9ubJEx3mox4AUcQWyRzqUQXNS/UdgAoa/Uc5o0xPGX85obR666OD3PSIW51JHjPV
	5MenUw==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjfavtu09-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 12:35:23 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8b0adb0b8dbso64571037b3.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 27 Oct 2026 05:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793104523; x=1793709323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
        b=PDN7sIEj/OiIxLqIes0gwT5vZFk1H4e9vkm9BTdoRqRe3jbUggUHzAzknzra+h/HIH
         7Fxjr2STkMHP2T7cleTTkr90iOQkkBV5o+UMoKHXZ9ZXnk0BDpAVvtWd0H9Pc46sIjsk
         m17ByaR/aGwl9cbLf9URxNdLQkL9f6C//j+eaJ+qT1C8BPEQyvVhE/Nd8qj6/FK0/wQx
         zpkyEL0oblzFIo7iI+ynWCo5ffs/Gefw8XrAcpic578S8XAdWxWZ2IbRJKr7U2nocSbs
         aMS2pKIIjBxR9VH1XgZXu8ZSalnGrnnUCL2Hcjp3SaAjvdKpjxpRF4ES0A+tQwU8udYe
         zOYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793104523; x=1793709323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dUg5dX/Iyj3+xcEdcf3gOFDKbltB8d8ZVgvvQ64fkzI=;
        b=ngQnvd1zUxfE2/4johRYmshCMzo3LTbIMZSAcLCVZoNm+ohJGQ+e7Y1WbioRm3hDOj
         5m8QvcFR7q3R32BPIJ1DX4H7XGI/zB9jy/PJvoD2/0k4P9M7dAvzZeweUaq7au6vkQGb
         UXZNL7gG6yeXp6mtyrrsQZHVBgfTDj+iMijoYLbtu7/YV+lcMx04upGZ+jXKdrIrDAyF
         j986+0dsG40VC5ljYO4OWSncc242nD48pxY9bXjp5CcLTVZw/ALp4xjxWLbrdzGEAmXk
         WRzuFgP4OaN79f+f1tr100EfanJBK7Y6bEh0LOgP4/pfROA9JZDlv0CeGWHh7hchcyY1
         J4XA==
X-Forwarded-Encrypted: i=1; AKwUvBy8i4DlmUpk/SMr2AnDtHStmu8rP+1EIRK47Rl2Uj402Cs9EjqxoNdEFufeYrFEdGhh4u6C1shD+IUq6ljy@vger.kernel.org
X-Gm-Message-State: AFq9FYIQcKeajV7d1CWprR9iKZI32Y2huEv25H+jh0mawT6RcC+0mWZW
	73CLJ+lp73y+R2J39jz8TAPHxMqQAFiVm+gqhHUUMW+POM6FVx8tl4fRIXNzinLrH9x65URjE1n
	M+3RvWtZVWX8n72pg1QWVcEJcf6cIHJzy0D9viJ4h9TC/wDZNw5GLDEDkdX/cdlgWsqCu
X-Gm-Gg: AYBFou39pzWgLBYednHQuN2/6GUXQk49C9i6UtiPtg5yaUM3+zENq7gwHw/9VD7QkWO
	IFSZc1yHi6PNE6ioBoNq1FocAsGJxdQN/Lf82sPdgHs1mp9pSvEiadvDQXojc4b/gu882bHAmbJ
	TW0Gk4XxwZiZl0ET7CAouR0K9P+YxaIquR3SnQ1k2F7VZnF15bBFmSzB3O0kXaF+oh9nURJlLi6
	rOyjEUyeKAxiet31oQNUjr2DEqBIqaaDFIIxKCFsHM7G6wXhvmlXKX01qsKYXqvEx8AVvNITMDx
	kQwUexMP80StvTE7MzRtnUKz04k9UiOzALkPggUkwUYzi1OtQp62gg1ykvy3eEOyBKmM8swkd5Q
	0/Hdko2NEzKzpWUifjg==
X-Received: by 2002:a05:690c:fd3:b0:8b0:de8c:a3a3 with SMTP id 00721157ae682-8b166cc62damr80032037b3.69.1793104523169;
        Tue, 27 Oct 2026 05:35:23 -0700 (PDT)
X-Received: by 2002:a05:690c:fd3:b0:8b0:de8c:a3a3 with SMTP id 00721157ae682-8b166cc62damr80031767b3.69.1793104522417;
        Tue, 27 Oct 2026 05:35:22 -0700 (PDT)
Received: from [10.213.109.130] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b19e57d131sm10413507b3.20.2026.10.27.05.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 05:35:22 -0700 (PDT)
From: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 18:04:18 +0530
Subject: [PATCH v5 1/4] regulator: dt-bindings: Add
 'regulator-off-on-delay-us' property
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
Message-Id: <20261027-regulator-off-on-delay-v5-1-f9c3b128c6d0@oss.qualcomm.com>
References: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
In-Reply-To: <20261027-regulator-off-on-delay-v5-0-f9c3b128c6d0@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Saikiran <bjsaikiran@gmail.com>,
        Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793104512; l=1438;
 i=jishnu.prakash@oss.qualcomm.com; s=20251014; h=from:subject:message-id;
 bh=8ZlC6sJQp0U3FTSKTP9WDG1CV81XRr9JEfHI8yU8VFI=;
 b=/hPOEDNrc62EetvSsVAYKEj/2yA8UIrOp4yK7jzuwlNRf5eES1bVf/l1yc98V/f29ge5qKXJq
 +B2K1PTKPcsCibm9wVwWF2GOb+B0CRFIENx/XeteZ/tIud+ahZX6Ube
X-Developer-Key: i=jishnu.prakash@oss.qualcomm.com; a=ed25519;
 pk=g89pXdLVwRjdTeQ+uX1QzvBO346E3hQAc1N7fcTXgmk=
X-Proofpoint-GUID: L9xC_jpG4pH_DGFFhEe3Ar4bm8L8Cb4w
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX6Ax1lh+0bvmR
 +n0D3WiBro2I6I/c7BwMdeTEsy7pQ3dVHesEyqz5WP20BQue2v6hIbGOt7qjEIJLfbXlWVIJ5y3
 W727JB/ksMPAZEMYVE9KlD140dytL7c=
X-Authority-Analysis: v=2.4 cv=EIeTQFZC c=1 sm=1 tr=0 ts=6ae09a8b cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=pGLkceISAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=xl1xDpuIGGFnwhC4BG4A:9
 a=QEXdDO2ut3YA:10 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: L9xC_jpG4pH_DGFFhEe3Ar4bm8L8Cb4w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA1MCBTYWx0ZWRfX4Be6J1Yl31zy
 2lo9xKZ4Qr1s3mG7nSPcc85CrZxaxfM/VzeSQiY7KGmBxWgtVu5C8tQsQt/LZzbSsPLQFvnjR8f
 woYiJl6Rn3foo2p6Ohc713QPfpq93/lj8XccJVzcNwvq0SNlm2ylIQunlzLOlq0rWjML17XmYhJ
 14itdycGmYhFoEQvTSuimjh1DwKT7OhmlGYpEeuSBdMu1Fjx1DQM2VKmkamHtWJbPClhGxvIg4d
 4zaY7Yl88/HXMO5JmoFKP0uHdWbJWyLU9OlgboceW76ldNCVNKY7rb+u7CVu5t1JOOtjkeDxl45
 drlh6T1Z8sCBoP2TAJrbEdcWNbIuQ9HSfDkvX7KlpBk2RJaIZliCf3sEUXYRQuJ8xSCZHG9W/dd
 u1rPLwwNRLLxKN1TQ9hUZW3cRFLO4tAGD0acX2AWvxoccPblvuZVzim+RPUyXfWpZ+gdRdGVTfV
 MdjuCpb8KmOA03YBbzw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 suspectscore=0 spamscore=0 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270050

Add a new property 'regulator-off-on-delay-us' to specify a minimum delay
between disabling and re-enabling a regulator. This is useful in cases
where a regulator discharges slowly and needs significant time to reach a
safe reset level, and re-enabling it too early may lead to a brownout
event.

Suggested-by: Saikiran <bjsaikiran@gmail.com>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/regulator/regulator.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/regulator/regulator.yaml b/Documentation/devicetree/bindings/regulator/regulator.yaml
index 019aeb664cae..73e1bea87adb 100644
--- a/Documentation/devicetree/bindings/regulator/regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/regulator.yaml
@@ -243,6 +243,11 @@ properties:
     description: Maximum difference between current and target voltages
       that can be changed safely in a single step.
 
+  regulator-off-on-delay-us:
+    description: Specifies a minimum delay in microseconds between disabling and
+      re-enabling the regulator. This is needed for regulators that discharge
+      slowly and require a significant delay to drop below brownout thresholds.
+
 patternProperties:
   ".*-supply$":
     description: Input supply phandle(s) for this node

-- 
2.43.0

