Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794111696;
	b=xklzCKF+maYiBnTB4d27oF+pmJ7AR7R9YSqt502BrWNYHFwZ3JljAB8I3GM7RsNKU/zF
	 d+kPNm7pLrzSd3qK8PKLBEm75UIa5wF+srnVEYKXGWP/swzJ+mjEW+ik5TRUmFNo90ADc
	 Wx3MDnT3LwrZAIr6qo7hCPFubXHcApMgeUdTKXBl0cCkXqH/2vc9pz+YrRhU8pkmXBUhZ
	 ZIRSv6RwNCQ37/AX/btevBgiVJH/UFQlJNtNfHW8uhNKz1VuDnq3o3ewxqT+0qdpozQKY
	 8ZRYa1uu8Sc6DPK1qZP9LotiVCEBUNbdGsd2JJAjBJBvJ0VcMlrzhBCrlxvdCuLmckw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794111696;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=;
	b=boqFEYp/3aT+WaTj+zBwG1W+6r5exrFnyCGysv/cIq9a7sfLDLDf5ejJ7kdRZX5HMAAG
	 KLrp0yzkwSnRa1oyrE4X63/zlG3pP2g953YORngzb3SDa3SyVDe6JkSbIx6jNdcqtgGuo
	 bezUk4a2hGWLSHTj9FjkB5Z8oRqGTYZ7Pu8rK8BpHxE1IGqecUraVQ9sf91GCa9BL/6rq
	 91n8vFRBQQHCEejWCp8ojmqx1w3lbSj54wWyBNQfac4yByW55mBFwGJGfxv5PlUuVUqx4
	 FtpQK2tWXT7CfVZZt0KvwQ4SzaiHYYjlchljwSqai3YYG6ISgfsnckJ02jzmztQZVkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7hTffsU;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSbNeX6O;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB067606A323
	for <linux-arm-msm@vger.kernel.org>; Sun,  8 Nov 2026 04:21:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB067606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T7hTffsU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSbNeX6O
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A84K2Ef1520820
	for <linux-arm-msm@vger.kernel.org>; Sun, 8 Nov 2026 04:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=; b=T7hTffsU9/3FgYPu
	vVZUAw+bVsHc58D3UwzP+1TbtMWH5SO7zxcfiEIl7c7UdW5YhV5twOsW9S+tDEuP
	rPFDL1uxbchpXwD+y9nUjMZ6VqTh6GMhe7LvVizBmthp242/i1Vz8JkwhXBHdTGK
	eTFLurLIcncUajcquEUu49C7Zn971WFMLtKkiu96GtjIyLe2tiqylnbQREDTkasM
	jzRzoLqxbb5XMm+c/9UCHwbwbRSZyMxzY8zrfmfybFTgUxO8EDhJbYDfRr0j8nVe
	NEnDj2TcdrvJdljsd8zeDIHkrFbW//DHDqRdJBJcUsKP1PiAdIIu1+EJ2IW8u02S
	aqMbkQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hstxsadfm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sun, 08 Nov 2026 04:21:35 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-36d69ab3c2bso282478eec.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 07 Nov 2026 20:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794111694; x=1794716494; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=;
        b=jSbNeX6O7RvZpkEw9U4AdxGWNn51QHf4Rfx8HvveSGZ2h8It1tOKHiT2CQNRGfh0T5
         RNOk784eiz8HjRNF2vbRWomCDTDavdUkB+m6mjaoSsjGcODrM6PC+Ic0xf3NDFXIxQp1
         qBt7ydCMkrGUpKFW1Ud2oxse7cwZeFAv9g5+lYWbWHUrjmieD1ydLva/SxWZ2oMbAWrF
         cqyrXQbZlNG6cv3wGkjgbEcSgT5/arsXo3LfMIMZK5D+UPQgu2+jWa21uXPXSQkbr9hE
         0Pq7rA9dxhHlE9T2kkTHlP2KXB6b8j3UpuL8unygeZUdGhUwGFOBaGstM5Lfu/PEGf8w
         AbPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794111694; x=1794716494;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SfWUdM4Z2qWZxJdkUtIFfywMuhATGgqyOewLKoVXPIQ=;
        b=K5I/doH+AjaUAqXZ95ffK/pPKftIWKh+yDec+05PbGLXGTlcOxux2vsAVRJ8GXo1G1
         NJxD3NjCcYZNwlysTMhSlUYFq237kqjR+uN1xwPD/05pMT459iTZwBiMmKRCGin+lvfi
         i55JoeArnSlKh1VPSHaTxUBtyFq8tYtrIiqBDYPaS7uDHJXkMz5ITrQ1HnkrH5cdqktU
         cNzA3l5ICaAIEF+nW91IeIQzqlPZyush64Dsw6r07fyU6MM0vwfgaOgb3Tua2hasIDa4
         kLFLbCUC7KCx/aKUZ1aNaJV4EYIJGgUc64eTzKt212cTLGmaJgCdOKl0IbNQG9cG7WbG
         sWbA==
X-Forwarded-Encrypted: i=1; AL+hErGK0a0RP/Q9673SqwPwjn4DjZH2UC8VO/0/X8uByOaNET80xnGeEl5R5So5c1ypo4tAis+mU9lbRVM+OilA@vger.kernel.org
X-Gm-Message-State: APuU4Z//e/krMg8WUVcjQIpHltGo/8hl/vLcmGO5lG6yg6kXm+J+aA4c
	5G+RcXmxBmmxe5uS2ROGvImPpUX8s9y47e/O8aJ2WFH1b9B8ncyURRVeDl6RVe5xLOz7/1UI6Bp
	fdMDMBnTYEqqpjyZOClMLYwuA4VaqkUp8wIqOiWkuad9EMeAQIBwYek6vXgTu3t01ohqt
X-Gm-Gg: AYBFou30McqMrl0CNG0i5QS0+fi5mwmFK6dthnUrpNjuMlPrla5p8inbZNKev/mxRCm
	z8inprosFjMjv8tV58DUIuCcvjX3lBQaSaYmFiptSsGFM0WicmYZxSkgEg9BHDF+0rPva3JM65I
	7TfVSHOgp7+8d4VqI2/OHjYVfVjPPqyo5Wtl/XttBzcIgeGmyqytomfUzoVLWhK4yrkjM1lVLsk
	860q6KKA9plMwqEPIhM1KUNtXfJHaiSb8f+UhG2pkI66R6qZlCa6IlF6FadfhAQDOsH4KN6uzgA
	QXRduFpdhdFiMF8rkMVtMNB4ehCXPvVcxk1V9RIsAvlr+z601EKntkc+lYIc4McjMPDupSlrw3P
	pl2micXMQkXVOHEby72IbCSLk4Y193CfUOxn+zEo2/Ghyw/nfkxU4+GyTpY+uxGNxuEk2aLqs8Z
	f9rX2wfn/n0F/sNes=
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id 5a478bee46e88-37256614c62mr1597397eec.8.1794111694385;
        Sat, 07 Nov 2026 20:21:34 -0800 (PST)
X-Received: by 2002:a05:693c:62cd:b0:370:ff2:f78d with SMTP id 5a478bee46e88-37256614c62mr1597351eec.8.1794111693685;
        Sat, 07 Nov 2026 20:21:33 -0800 (PST)
Received: from [169.254.0.13] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-372666d2fcbsm2211150eec.24.2026.11.07.20.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 20:21:33 -0800 (PST)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Sun, 08 Nov 2026 04:21:03 +0000
Subject: [PATCH 2/4] checkpatch: don't stop at the first non-patch input
 with --no-patch
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
Message-Id: <20261108-checkpatch-fixes-hash-v1-2-d49b3085c20b@oss.qualcomm.com>
References: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
In-Reply-To: <20261108-checkpatch-fixes-hash-v1-0-d49b3085c20b@oss.qualcomm.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794111691; l=1135;
 i=bjorn.andersson@oss.qualcomm.com; s=20230915; h=from:subject:message-id;
 bh=0zU7gHyftVtbcfHIxFLj0uscADSYbqG5RMY6rYmlFnM=;
 b=0QbJ0TTNTYpa3sJbEj7jebrwoSYtcaEw7U+s9tFSECGdc2a9sVuiRgsQc3Hud/ZcLgbwYdvG6
 56xrbwS4NyFAEuQ56sJ1TNB7k0pu6KEemSpK/yoSNWg6aLAu5cyMWXQ
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=ed25519;
 pk=VkhObtljigy9k0ZUIE1Mvr0Y+E1dgBEH9WoLQnUtbIM=
X-Proofpoint-ORIG-GUID: iJskfc1G7JrfTzymQlP0QM1CyZ12Mj5i
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfXwA9ewPqJurti
 YOQ4hUMX6/CRTHc+7/iBDaFSl9mopUowA/zKHa9E4STfl+rJeFpqB+YKQSbwrWZGs52KWaaFgko
 yWqWb0E6ko28JP/u7UbvaENb0QTEj5I=
X-Authority-Analysis: v=2.4 cv=dZMVTnXe c=1 sm=1 tr=0 ts=6aeff8cf cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=sgsBsH1kTYZblYGAWkgA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA4MDAxNyBTYWx0ZWRfX0iOy3t0FAt5V
 k2xiE9E4aEz/pEMCWKVd+p6K9EoWxE38Leh+dcYi9X/ickGix6OfTPvOCz0BgNljjehaveFyAdR
 cyRHRqlB0f7gEhCuNMDp5zEAqf63KA/pwG7qG5+Ixr0S9lyV/HHrsdC4KakgJ/gzRactZho1uIK
 sH48Plu0u8rVY+kqpcS0d6X9Ex4RZvl69sTFb4Cb2J3/pVuqqbl2o3oSn1A+matkNiHB/ML/lgA
 ewNqZscjhaSQt23lSpzyvMPUSJltcxf3MAWTq4ITmJYllY6A+4nflfDuN8rQfvXqtKBqqYV68mn
 lLMBY8t82Fg0ff1MAqJdfUBw75/u5+I6tuuy/RrrnGgCx0BQx3nj4yXJv8M2P7MmV23HVJaMln+
 Wqcsh/WocAWsMBSaDVZnVoaKXBmN1WMiCgXtZZJccmUfhneVV1ml4shEvj94lhNawuM8tZ+xwbt
 2KosLHpp60jJiYLC7ag==
X-Proofpoint-GUID: iJskfc1G7JrfTzymQlP0QM1CyZ12Mj5i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-08_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611080017

When checkpatch is given multiple inputs with --no-patch, process()
calls exit(0) as soon as it encounters an input that isn't a patch.
The remaining inputs are never checked, and the run is reported as
successful even if later inputs contain errors or warnings.

E.g. with a non-patch file followed by a patch with a bogus Fixes: tag:

  $ ./scripts/checkpatch.pl -q --terse --no-patch notes.txt bad.patch
  $ echo $?
  0

Return from process() instead, so the non-patch input is still
silently skipped while the remaining inputs are checked.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index e84bb4c12eb4..45279c17f70a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -7886,7 +7886,7 @@ sub process {
 	# This is not a patch, and we are in 'no-patch' mode so
 	# just keep quiet.
 	if (!$chk_patch && !$is_patch) {
-		exit(0);
+		return 1;
 	}
 
 	if (!$is_patch && $filename !~ /cover-letter\.patch$/) {

-- 
2.55.0

