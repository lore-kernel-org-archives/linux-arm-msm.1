Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795603119;
	b=nVO5QjOrabbV46x0r9922OWwVbJSmvJjveJO8dAIC0TGidd2cXACSK3iug73jJlAgk8z
	 TO+wXitOJoB+6iWwWULos41Nggf/BDmnN1rpXtJHBJpWYfvSacuykiF8/MCcUfiejMHkK
	 V34fIgYLwX1tSI9uLPICc1mKcUvy1lKLFd5kd/2u/Dal/nfJWohwIP7r3mtU4Sr8jAz8y
	 zDODTBfb+OWFL2MMgsP1bAtlheP3MN/ZUj1WDk9enKrkwLGZBgiTDUkgNLRMHfAsvKirP
	 fsvYlWCYE7CTcTcOK0Jm2A+Gb7LLMxXTJrPLDwVJKvpvwyaVXRcMQ8jVYwiWRhOKECA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795603119;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy7SoKy798=;
	b=hDc22PfqlL34Sk0YhBsYI62Yveu4C8d8TP99IcHTfP1tWMwG6sQddvx1Dm7Wn60/UwIW
	 osr9jEJxJLQsyUdu8S9nKLwxtyQOjmzYu46yW3WcAJvsUXceWVY+l4gsgarFpCHJxrEwY
	 gyta6pS2An7CyK2dqCu6+1nJWdTKUSjSUz2hZlnz17BPJJY664SlKsCp3mo9W/VtMceVY
	 7c/uNL0tZPsa5cbHA1snVV5VgBeQvz2Yvf2ncvTs7Zi9xkyFvQeQLt5WYpMduxQOd9Vsk
	 CI21x1nZxk0epHkqtFSb+IpFUVkbOfmtAb2McIxFLs8Uwa7H5H09Iq9e8OCoNxXR5RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIlV9BIY;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkJ+0eGu;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C03B606A32E
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1C03B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gIlV9BIY;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RkJ+0eGu
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP9mFIx3126473
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy
	7SoKy798=; b=gIlV9BIYUQ6FbHNklMRnta5hYmgxqfFSNL1CsWUbWDFuvlDzRoF
	rmEJ/rxczMLQb//yz2ucn8kWVtpcMkoNPWSK4GZeidbPkKdSDlMoROYwt2VLH2uN
	kBdK9i8sn6Dq8ULNTf+EE8mznxSxKUlHpMLRHmsYIMeR5zVVxOJshrpWoQSQ/1xU
	KveRVLNf5soJM+VGk/gfyggeZmzN03HDXTVBeLwoKoMKh9zq/PWz+WlPCq1zVOvG
	Qjf4ui66Y/4JJNnaSmsPByGHjAUyRKVl3OtgL/nuE2+Wzra5mPQMBYxQY88zT50o
	bLlloJ8zPV8mW9GA64jZ7toqdMrQ8KFwrAA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5eydbqv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 10:38:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-934963b2bc0so1010025285a.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 02:38:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795603117; x=1796207917; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy7SoKy798=;
        b=RkJ+0eGuV+iEYxQ9PE8akrsqmXCBzGodOmNHOZXOFKDESRAN4zi3OrpvhMNdMlm1Mq
         ppqNYeleqoihtGvrHL31t5dMkJiwHpYHAlsKAgInjt7DRCfNq/Ta2CPVlZUyYJNlzMeu
         62HdMGBhhNz1JuifYnq0FE+JDXx7VtnqUSpj1gebV8aMB3ORwB7OUglYh0A808DgXZkt
         9MF0OvZ9DDoWiYe4mCzASoD9zTBYhDzWcdilcV5yxmdCr8V4kI2CDJMmbgtFPpvMnDWr
         x9k2m/8464LJ29SDXWZgGNpuBOzyfsXGNeMSene5Cdn4C/Ah+CcbBorTs2NUW+6j8Prw
         FznA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795603117; x=1796207917;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lYNN0rE+dUHJ/lh5txZ4L6ybaalR++hG1Fy7SoKy798=;
        b=SqC1NjO2sYK2GcCyP5e5ViVJyNyzuYHvZYwT8EYEV2s4QYfkGJ7E6KK6tBnGguLZ0b
         NhuSkR0w+CdeBAPkUEn1HfcDdUb/RXqIBtOXRRTFzDsPOJqIUZ19UYSQWJRqsFU2e4Sg
         K30vjjFAnbMqzr/OV3I/8cPqltJrvW1DD2B5sO0U5xeyikkAYnGEsIIsObrJD669ucGW
         62SCgYGcwk2e5X+uf9wgVkovPtYPL/EwXghSSBFSW53sPjuv8z1QEfHDncRvheBOWQCc
         GZNyTUnPemdit2/I/mKfzyC7fs5jg3Sax/5+qhIDUwD1WYMC9P3n2TpfEwquLzBX43bJ
         WwIg==
X-Forwarded-Encrypted: i=1; AL+hErGu2y9ZMIj6QgR1H76S7Y0rh8B1KwYZOG1IYOwS9uhD1+84VoArIlyd9ZpIBPgXJ4fJLc3Si5M5KhUeqO8f@vger.kernel.org
X-Gm-Message-State: APuU4Z/ffF2XzgNFQfHHol4sYcCEC3BaqOYacqzyX7cWcJYH93OUbTA0
	E2PLqa5L1etIF8XXHhJuNbPhovazD8klmUU3b/u6MD8mfbjluCBTuNcRWWHGKDQkZ2obrtuSR/O
	HzxSzseCbY+lLSRyw1Cn1IlLuyfAebkDO6FTPfoZP1fU7UvpOLUxI8EFSnxEGuKB0qXhe
X-Gm-Gg: AZFdTZeXgSCeSgxCShnNbrKiOxxHGYn6BEULlOv6gBMeJtrG+p/Aa6AU2sERSf1estI
	AfBp6uc+VTWlE450uzH/RbDeSEhLBlcOcL6R70ZTU2bM9FYMw8E8Y7pSh0UDukcdEGhK9GdsEGk
	NQ+55YQ34mVuNoPrBJ3SwV46EeQ7qVpWwwiKRMPhM5+2ZzP4GwllDJMdPafrSEnE0oN6hJs9qJS
	9JDRlfo1OmaxtLJya1xxF8aUjDaxdOKY9kvPG4AhpACHw89JqdP2VtXVenczPpmFf26VbVKFi2r
	1CBtx37XpBEpItOj9C3N18dC25c1ulR2poMaPiRK+ohu13Q+bSwSODIul9sbQ35BzLirJ9lgC1b
	LlAzs6UdA/CZI0UymbdF9APdN/eIAU2M5VBrNebpKzitdiYZ+pjEROffB7BEhU+9W
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3060479385a.35.1795603117180;
        Wed, 25 Nov 2026 02:38:37 -0800 (PST)
X-Received: by 2002:a05:620a:1713:b0:93c:6534:d04d with SMTP id af79cd13be357-949baa0d7admr3060476385a.35.1795603116608;
        Wed, 25 Nov 2026 02:38:36 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6baa397asm34171502f8f.48.2026.11.25.02.38.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 02:38:35 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>
Cc: Bard Liao <yung-chuan.liao@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
        Srinivas Kandagatla <srini@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH 0/4] soundwire: qcom: fixes and multi-master follow-ups
Date: Wed, 25 Nov 2026 10:38:21 +0000
Message-ID: <20261125103825.936939-1-srinivas.kandagatla@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXyaNKv1S2ZWwT
 RIBRtrG8mkRsI8nB/1ZgMEaBuV7OJmMB0bx466eX3jvtDIievA117r7Y4VT6dbPlxVS+bDJ6S51
 CMLfxzM2PRkeExkyOwhaDLsKWq6Dsf4=
X-Proofpoint-ORIG-GUID: Xj8nXJBy0MseVtFl78TGeCBiWJxKayzc
X-Proofpoint-GUID: Xj8nXJBy0MseVtFl78TGeCBiWJxKayzc
X-Authority-Analysis: v=2.4 cv=GIGdgeNK c=1 sm=1 tr=0 ts=6b06baae cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=_Oj4qczf_YSIFfDCRqkA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA0MiBTYWx0ZWRfXz/X6UX+7EHHz
 bD00dTEF8AC2TjZTmcUGoOGJdFELvL+sjK7Awdu3qJgenwsiFmvrXYy7k9Xlc2eTlMtcJhDTZ/h
 yy2vl2x3aPEMBxrEbGQejz/DlSu1VsXPD3pbU94093xNI+lqZW95slb8lQdSkWQBEu6k2jXjQdn
 rTd9GPP/3Fx2o9WI6tTjlqhu5GJ4xxCTcjXcNWgyp6e3oM/LC5PyGMpJHpOuhf5e3w5migx5cfZ
 GI5VEo8kd2j1PpawI0b4Y0+QjiLFt0Bqc79evJIsalUvrlH4BSgHZIEBJOUrenP99aeom+yY8S+
 DPv1tMRtpTe1SqPaj3btWqNUbS/zDFl7eK/ns2DyLwECAsBp7SzVHaoFCfLwd54qqQyaio/gl1X
 PdfZRkv34Inl8TqiAYgazL1jk8acGNJ4WIYadCYXz4L5oAQMds/9bA2rVsTG23PMuQPn9mWvBEv
 VapqlVVfL1tzrknIg+Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_03,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 clxscore=1015
 spamscore=0 priorityscore=1501 bulkscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250042

Two pre-existing bug fixes (Cc: stable) picked up while bringing SDCA
capture up on Glymur-CRD, followed by two multi-master follow-ups on
the series merged in vkoul/next. Tested on Glymur-CRD.

Fixes first:

 - Always set master p_rt->port_params.num/flow_mode/data_mode in
   qcom_swrm_compute_params(), guard the port-params callback when
   bps is unset, and bound-check the master port number against
   ctrl->nports before indexing ctrl->pconfig[].  When the DT marks
   word-length as SWR_INVALID_PARAM port_params was left zero-
   initialised, so dpn_set_port_params() was handed port_num == 0
   and bps - 1 = 0xffffffff was written to DPn_BLOCK_CTRL_1(offset,
   0), which is outside the DPn register range.  Addresses the same
   underlying bug as Marek Szyprowski's RB5 report.

 - Skip offset2 programming when the DT marks it 0xff
   (SWR_INVALID_PARAM), matching the behaviour of the other optional
   port fields.

Multi-master follow-ups:

 - Fan broadcast writes out to per-slave unicasts on the multi-master
   primary.  The primary's HW never raises SPECIAL_CMD_ID_FINISHED
   for broadcasts on the shared frame, so SCP_FrameCtrl updates sent
   that way are lost and following unicast reads to the slave time
   out.

 - Program SSP_PERIOD on the primary at init and on bank switch for
   v3.1.0+ frame generators that derive the superframe boundary from
   row/col geometry, and zero CLK_DIV in the same write so a stale
   divider does not survive.

Ravi Hothi (1):
  soundwire: qcom: skip offset2 write when unset

Srinivas Kandagatla (3):
  soundwire: qcom: always set master port_params.num
  soundwire: qcom: fan out broadcasts on multi-master primary
  soundwire: qcom: program SSP period on multi-master primary

 drivers/soundwire/qcom.c | 72 +++++++++++++++++++++++++++++++++++-----
 1 file changed, 64 insertions(+), 8 deletions(-)


base-commit: d9ea256ee889f3db9f0bd07ce5d114ce92e31b4f
-- 
2.53.0

