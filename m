Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304695;
	b=5WejWhN0w62XPu39AQWEBxoz22ucWOGWiy9CEVVcCfxl0l+9wrnECO6CDfOqbEQgu/tc
	 2oDNZdCE6WABOM/xzvFEWnO2ea2J3OyYSmIqaKSc4nnCQyp58y5ukiKIUPYLhjlexj6MA
	 OZ6RiApMtqnWQzjLwefrr4SlrYN13f90Vd91jwgsm35ofAsPMtyEUDqeQssqAvbmaoI3S
	 xtbx/WfDnrUB68ZSP2Oq5+oKHsqsRyCiQPHdyz9c84s+PQrEujtZhTmpexZyoa+rRA2NR
	 +eaf6VNeEr6xzlD7RAzvsu0hN+8I0jq+0L8Qjb0EyESCbI9IjHMJ0oIt5GpAMhWfs2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304695;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
	b=2y/9wgvv6sdPmvoDSkWJ3Q8QGWKo9HjHY+nLi9afaJwFCxoZoiDYgbbcVvnmjlvbA6Gb
	 SLMhrRvdQQFPqeO05l6MA5wVZ4EIufy9t0tVh07fm6y7XRB2UlHTbeMUl6SYgen9ZQ2nZ
	 QGqgNbijmcaod5+Q5xT24biiUv2wgSiEEg53mJD8iX6JIMqeQKKzQ9TV1SWJAWV4V9TlJ
	 iVufLbiefIXmJCTEG5QGvHpb3Md15DGOG4vYvw9KoIgW5g40yFw7Nz6qR6pq4aDtgljHn
	 cAEEhbnz6n4bM1rn6+bW1VxKM8GtMYqE4LMAqEvQZwNAZ7O1OZr7P5tD08x3HPjJptA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaHFHGUn;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhs05U7T;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91F60606A332
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91F60606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RaHFHGUn;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Mhs05U7T
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8W6gC2833675
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=st+FkmjgxRkO2p5uixOrBU
	L2Qow9wwEX9/ybZqtET0c=; b=RaHFHGUn5JcunHYUUobWtAI3ki0W6U5NK0DwIm
	0MI0WtYdI/A5FEwVWqOHRMBT/xsdu+r2z12mlZ2WvzzXjMShZ14Cryd0kEj0pgZn
	eRkUhEbrHJfd1YvXYZyQxHiNaA+d6HKgofBS3P5eoEv2DiB599+K9Qq/gadW7Zzs
	9ccAT9ZTLYPh8sYTNBoS2A+12rpMxUk2jU8HpnjYzuHelRfHIsIT/VVfHMOXnuUz
	zYrSrsTsNfUvnYwhiuGWLYnctuQh68t3307hEnsgguttJMtm0wahzX7L1bqsJQDj
	lzBbmMSozRDLVZ5A1IkI5rAuwUNQBJ+oT6I3f4OdQPOphEbw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufratd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:58:13 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1b3a348a6dbso2187117c88.1
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:58:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794304693; x=1794909493; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
        b=Mhs05U7TVFnffqRWKGhCr4j8nfECnDRZ0hXvEpSiooyuVm56xL9AtoxV57E7wdZW4i
         rUqJVqO1s5Q0oxUePUHF/pryuCkvoTuBeBY9WEs2VWeQT6al95+5Zo4jbr9NlTok7AjM
         8G0hOHHN24PEiGQPkSp4NVpI35levKn/t+VPtqGe/l8qrgv85pWlxUxmnqr/l0HGZgfR
         ciYLY/0MoWaVDygt48sFJqM44cc5cy+BrknIYryoZTw0yMfK8LLCIzcfvrQuzF3ltuCX
         ebisP8YDNj3G79YU1HLi39Sgjm7zSn2IuSPV9uXmcisOPovs9FLUKRPV1CXVCvBGXM+t
         mKvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794304693; x=1794909493;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=st+FkmjgxRkO2p5uixOrBUL2Qow9wwEX9/ybZqtET0c=;
        b=cmOdgfP6jEM76D0t86N5DJmygt28TupwrUylc1Z2V9ME5LniMDhK+WPk8Qq2lYiDRH
         pHnB6EBzUWhnbTc9AvmImMUBBtaiAHk0QEYbCb/RolsQ7XA29S07GI0/m+1+89xL0HzG
         SQtBZFxf2Fvof01xRiFLLIfFGaahZxQe9eqDibyGHQUMn888DQzhjyroWvV3b24NOtI2
         OQcjnC3i0/E0nQqkOo0kuqwyK+B5M9LHpaTGa6q7bdqh1aDdP4O6q3OBon77hQgxlPAD
         cEoHQJbfEOEpZv+PwTjkYS0fcjr4BTqzT3Ul1Ibz6F2wulZfS8U21oGy/vrgWFCskM5a
         FS8g==
X-Forwarded-Encrypted: i=1; AL+hErHEXRSaNWg2OYbLx97UGiObvXbtHI3gzM9piZDaHNXtAVgTjkh5sTinnjuRbPDKq9pLlUoavqrUBA8wMExA@vger.kernel.org
X-Gm-Message-State: APuU4Z9Ws4JCkkDRVEjzcIMW64oQnYDHE69UOhHF9hWoiKUuBG1bovQ1
	vJSQ1uZVw5uMDec6+LgHVkjZN3IPupm3bTBoMDMwdg0bSUkRQBoNXsQEROqoDSTIMo5RhF9lR56
	ZkIuc2ZRpQCqzmnwEJD1SR+cCm25e4TC3zbojDKiFVJNfPT8mPp9xP/6D2V9im1rfaRDM
X-Gm-Gg: AYBFou3PLa7W/anyR395cmvaj7Gi84Jwp1Wx3Ob/9BsLBjE4oNEdRTUuoR6Fhba7p1I
	RBfh3osODv0Y73AxkYzIVK+kEQwDLmk6m6qihcpr/zkchn75W7sfQKYYEu+p3KzxoDNJswo512S
	fhQF63PDdlYrWSIGTSwtQhavjwGtCVuOurIh1uWgQLSK9mXvokQjhf4mKDk+pg3EicOAIbMcOfR
	gKsfbaESpfXb6faz6DQ9pwICPVU+PRYp2GgzM9mnfR3OcDDpYcbwe1i4cqBnTasTkqLlu7hLd2C
	F8jD2RHTxT8yF1M8gj7zO+BJCwRn++3L4HwDhS8M8USO7R4cGYccvoflA9jxuCOfAtuXsDhtQAk
	hnac3ROvKWgF2cIAL+vWOyjh/BQHAIeXLP2LpQ7uDRLiDfkSgLIcgysEQuZ4RoD2vgqzQdsj6QH
	UYJVLtCQ==
X-Received: by 2002:a05:7022:f8a:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b3b5fccfa3mr4008466c88.13.1794304693048;
        Tue, 10 Nov 2026 01:58:13 -0800 (PST)
X-Received: by 2002:a05:7022:f8a:b0:1a9:f97a:34d with SMTP id a92af1059eb24-1b3b5fccfa3mr4008418c88.13.1794304692520;
        Tue, 10 Nov 2026 01:58:12 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b11346sm7333141c88.7.2026.11.10.01.58.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:58:12 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Subject: [PATCH v2 0/3] media: iris: Fix issues exposed during decoder seek
Date: Tue, 10 Nov 2026 15:27:12 +0530
Message-Id: <20261110-fix_dec_seek-v2-0-210d8c4fc31b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAHjq8moC/3WNQQ6CMBBFr0JmbUlbBIMr7mEIgXYqVaHagUZDu
 LsF124mefn/v1mA0FskOCcLeAyWrBsjyEMCqm/HKzKrI4PkshA8E8zYd6NRNYR4Z9K0pcyLrDu
 WOcTJ02PMd92l/jHN3Q3VtDm2Rm9pcv6z/wti6/1RB8E4Uwa14UoWJ8TKEaWvuX0oNwxpPFCv6
 /oFlu3qs8EAAAA=
X-Change-ID: 20261031-fix_dec_seek-2fa92563b495
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vedang Nagar <quic_vnagar@quicinc.com>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304687; l=1413;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=OoTEOWQbdE3NB0Daasfn0CVEElbzqxziQTEV4sVvvLk=;
 b=g/hV9z9s2R8N3SVEnJu74ymiGkSDFaugKOJVWe6P9etdbWT85UnQ5WMFuiHquXDkIevC8lWdG
 oiww5YXr4oECgEGH45EtFxB5CLSteZYvc/b5XnBYT5rdcW2ED4SzDhs
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-GUID: 4l4LvxjumQL8H4TRMClDMe6kECaSdFQh
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2eab5 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=dW6R3hR6YbmKee4CdVsA:9 a=QEXdDO2ut3YA:10
 a=vr4QvYf-bLy2KjpDp97w:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: 4l4LvxjumQL8H4TRMClDMe6kECaSdFQh
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXwJsQ1e//TinB
 qrQ8Uj5bJ/qm5aQ9zutNcu4B2ZgJWTSI7fGqm0BLzRoSC4YZVPa0X0r767rlYakIS83q81fVRyh
 l+gKWf+ROsYQOHcGfv3jVsIfk764Trk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX8CQhzuTfcuPs
 I/4s16kYasacw3Kgof1BnvUHYxdcNI1d7DTarxi025XvX8F78XXu1vR4PJRzq5ksu0HBt3K1bo5
 +vmbx16Tuh+xALuq2gMQnwedIxarxTls9SCHl5yjppB9lrQUwbK9fZGuC/LvW/Hsg3c9ZEMbHhl
 b6eRpMQJ/hLX0gcNyTwIgMKE0qhbUiXjtGxGOuIos6+6Atd2pflCrCK8b2ZIlsKNH+d8SLyQMxz
 pb5ElOK1Jy5qZS2X4s0uZqZvvZUg7eS0rpR872pp6zdx0Y466vSrGvu90asJhp7Ba2UJPdSilDc
 PhpLFpcg0Xr6dD/U0/p2BvtYzbW/iJUxBWgYqHPpS0ZcxT2f1XiKMzHdd/p1YUXTVYbr/8sMkSJ
 sDqWQWmX85gHP2qbvbJIH/4drsprwL97lcggIuRIpIHCr2SjH3LtOU0NS0bcRx6ltMxtbEq/GWi
 uI31VR6x5X4I8LeXwJw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100039

Several issues were identified while investigating decoder seek
failures.

A seek could trigger redundant port settings change events, incorrect
buffer requirements for VP9 streams, and codec configuration being
overwritten. Together these issues resulted in spurious resolution
change notifications, firmware buffer count errors, and seek failures.

This series fixes the issues observed during decoder seek operations.

Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
Changes in v2:
- Dropped the TIER_AV1 cap instead of removing the set callbacks. 
- Link to v1: https://patch.msgid.link/20261031-fix_dec_seek-v1-0-cfedf0c267ee@oss.qualcomm.com

---
Vishnu Reddy (3):
      media: iris: Skip redundant decoder input config params
      media: iris: Skip redundant HFI_PROP_TIER updates
      media: iris: Use firmware reported count for output buffers

 drivers/media/platform/qcom/iris/iris_hfi_gen2.c         | 10 ----------
 drivers/media/platform/qcom/iris/iris_hfi_gen2_command.c |  8 ++++++--
 drivers/media/platform/qcom/iris/iris_platform_common.h  |  1 -
 drivers/media/platform/qcom/iris/iris_vpu_buffer.c       | 10 ++--------
 4 files changed, 8 insertions(+), 21 deletions(-)
---
base-commit: 630059a5a632377b9b7b487baccde92b7ae1dd47
change-id: 20261031-fix_dec_seek-2fa92563b495

Best regards,
--  
Vishnu Reddy <busanna.reddy@oss.qualcomm.com>

