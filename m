Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795595927;
	b=JVVTxsVzvlkmGvLyCRcT9nAuEbU54om5uvn3+rBTYtcdciL6oOzHLCTm+gkLUHZ/bPAC
	 6KzM+A0iFI29z+/qNhNqzzWlRtIdxc+YKfpDgZDbHRKEkiek6FSwCWzxhEuugq9xRSGpv
	 VXu3HWg0YrIJwiBsrpvSR5tWY+WVR9IE2Hqaz5K7DSTF1KhZsAnOMo3kNU7Eu5dZhbFDM
	 1lqv5UIOK547I4yfFwwtYWKiQq8nhhVx5DcGk38+pRYZjcnMFPtivCUlxXdHgA+VKsYA/
	 DgMJvfIppsAtwn54jP5PuOw8ST5kPCm4fQGbx0NL30ImvQjSYR5N0kod+jeqC/YH4Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795595927;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
	b=nSvIOHygyWpuZHOG/0pW6esgYOw9Q+zTaAlT8AXpsBu3zs6Hkjo6ate7fCtCImf8fa+i
	 B/2BestizWDN3u4e7p8ZUAthgasY6Yj6R4ZfNarl33KOOPSzNwgESuhnbfCdvOYbcJbmQ
	 HGpajLdcOTyrMmQ1rz7MFm4Z45dKAtvG3nP0sAeWXqic5BS8P/5fJG4/X1jculSkSrP/z
	 MPuRVgN7isD8Muazpcs8pyrl2GhJmzugQTxRxRFon7yvylgwa47HL1NCZIcLvEeXFNJ36
	 GcPzqnFFVyM4LFRZtusZmpCLFyhZ2RTTr9TGGoMKNSJjJXsy59aZiz5YkqDVawTdl0Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=caXQmvYz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtwPxSr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34274606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34274606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=caXQmvYz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gGtwPxSr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP695E73114979
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=j8mb2yiioJKUWf4gPuStEb
	cGreiM6hFgxHOginPRN80=; b=caXQmvYz1IOPnu/ubLHpLEKDPxrBbYPRqzACyL
	XyXZOtGsSAvRXe1HrEJ0I/evg1zWzykQ0GmNg2qC9H/VQGHEkCC7hnvxOI2hU2A/
	uGNl5uqLWnUgK7f4Dpg+3G2t0Cw7mzDV0i9ZcP9oYC9HhaT0MjCYMvTfniNyrdhg
	NRiPFfzy7omlGG1MX25kfNTxYPGCUhqhRPLwJMqMmiJKvmed1dOxzI9hbT4HV2XL
	xJRLRuAVMkcX4CnOE1GpdSlQ41PWmDOEz+YCSQ+jKyqQKgn6uZE2q4ITATRI0lA1
	MLW8yTm5k4i0FQdQS18PSFN+dYb9pk3VXiwdDKAWdNaixe1g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5gnsamky-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 08:38:45 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f33438950so954043585a.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 25 Nov 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795595924; x=1796200724; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
        b=gGtwPxSryZ+NJMJHehmslPBusIW4t1mJ2Fli0neciUIZoF79XnPfBg4nfuc2EWQ0pv
         dpIVamq/TQbprBog7FPkQcSXmT538NWCC8gOo12z3qcCWt9TqPXns61/gKeYwfw4JPqE
         lStu2nI7CTbF8xUnUFC3IbNVmSCtlDe536Nxs0r4O5yqFPdX/bCxt3iFrDP6a6Wp0UAm
         io0tmQ9PcdQbAhUDoHukokl8B4ldQLeF65c/YEaA1ECs4ffTsDqZ5idVYNCUZmFhF1/w
         30XFVWhVFWqb6AmD23YHe0j9/FLE+u292jQnxSR0L2OYQx8hieOlTAxAEe0xrI/e6UJi
         rg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795595924; x=1796200724;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=j8mb2yiioJKUWf4gPuStEbcGreiM6hFgxHOginPRN80=;
        b=ZB8uEEW3GfQGfZL2skO8/+8kAiYSzvJcXyMI5WuOEjlxYB6q34R+WN5bODGJsO8LRz
         q0MPYIRnDpW2/q9xmZPl39Rm4Q/4SeI0pUDIYcHOSXrSpZo+tksoXIagrgR3clGh7C3M
         JCslqldUgGMA5r8XoUUpuB6d1kR6Sjsw+6vpfTbtSsjjvx/lTsXHPh3qfVq8kIa6EmVr
         ZGQJsKtMmp/1Jrtuur6GumqjZFUepQJwU0dM+briIeDJOy3PuCFkkz6X925+AleVGdIo
         B0Nq6kUUp+VaPNKduxdn2W57vdyrVuUmYAnRATSTJQy+hu9q4ciwQsvwTUqAzsPQmVyT
         MbVg==
X-Forwarded-Encrypted: i=1; AL+hErEVzctZLiJO1jGpcKTcELU1SXSu7/DtWAELET6xZLi8t2RyG1EWVNcu/z+EA/KPhgcNHJzIJJhfNa61F2Y5@vger.kernel.org
X-Gm-Message-State: APuU4Z8lfB5FxgIup2ZNjPdgGUHnMwFERgeuBhR/O3gIc3cVtXwEXNA8
	OfmZVuKxoLFwS09YON1hQYatPRuy0fxNNaMFT9s591lAsiJEt02aMqtAihMuvxJ8T7XCJ64q15C
	ht4y9kIo6o1Wv/t+ws3zjqGagVNz1LqKGGP3tE5oHCcbP25fR/8Iz4uSJyumkvARHaap1
X-Gm-Gg: AZFdTZcZFEOS/YlqgcN7MCtGZRfH57l8jZmgJbSx8LHDeUBiIxh6gVYlwtd/9yfhDe7
	mxvOx58n61NaJM5aahiD7kmfFre1WrQQQVQO0wxCoZIQ9+ViGdCsAN1QAPwpoO104GcNvCh5WJp
	0x0M2Yy1I9jqPLHPIFAi6GZfjU/Za0YgDV/wt5gdFbRbChAjGedybodm3KWL5mU8VgXSdQDAYKj
	Mzd4fhIMLIKFwaL6KYcgg2WEnJe6QzlSmLQ7Ca8ytLn0Si9HWG6ZRQCSbMad+Eaaq2/2ZidjnJE
	2fX3mTHP8Zb3tToeq8P0sAOTh8py0BBsILEQU03wrYvBeHuFPs80W1/3iaFIFFvG+hEf1dVkD+M
	crrGHYjSTyF5g8BLx2J5W8sAV4NEJEFHrrvM8xxqPkFvFBu2XuUnuzSWNr+IN5XGk4u032OTjCJ
	eWZWlP0hQaGQSF86n3uhbk8lqYmRjPxR8fAMj9t263b8hn+30krkjsEjqHjcBYhEM34ouvYdgEY
	QjvcXDv9qnHYPx7A5XnuIEzS/wU
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr2930703585a.2.1795595924099;
        Wed, 25 Nov 2026 00:38:44 -0800 (PST)
X-Received: by 2002:a05:620a:1313:b0:949:7b51:2dc1 with SMTP id af79cd13be357-949ba80f404mr2930701285a.2.1795595923496;
        Wed, 25 Nov 2026 00:38:43 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:6c6b:1e5a:79dd:a527])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ad6403fdbbsm24626021f8f.15.2026.11.25.00.38.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:38:42 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: camss: Avoid useless RUP_DONE
 interrupts on TFE
Date: Wed, 25 Nov 2026 09:38:39 +0100
Message-Id: <20261125-tfe-fix-irq-v2-0-29dfa0955927@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAI+eBmsC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzNDQyMT3ZK0VN20zArdzKJC3dQki7QUI0tjc0vDRCWgjoKiVKAU2LTo2Np
 aAEqRTCddAAAA
X-Change-ID: 20261124-tfe-fix-irq-eb8fd293791a
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: zapMWRehxK3NZivmAMsva5_ZKGB88Acm
X-Authority-Analysis: v=2.4 cv=G+SJgNk5 c=1 sm=1 tr=0 ts=6b069e95 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=wrLyjG2ZGaWn_AwD7_EA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfX5fSp1XfbZ1iK
 ShEWkVRVBm3OZTQzXAElBXL+Vu0TO+Lfr9XuUBLceot0nQBZKQIdq7zbK6kcmIw2Hx7yKtB8ouQ
 zhrFvdHCHfS3S4OG6XatUWXprRr7CqY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAzNCBTYWx0ZWRfXyy68PEBwmC6N
 F8cRwxPqR7VgS4SvKNRfN9081P0uu5ScL1dT9at2Fk9im7WrPO0l8eDv14CJT14odF11JVOIXji
 rUIDjexiiL3/GlLIquz7c+McEWmx0h7NM08G5x2juM+yN4lLbllVrG4bFlXRwIx/FilOLhRlfc6
 13MMQOjTupv7H5E12E+O/UPJuebbalQSeMwlxFofuTTKZY5PWqXIlbQ9EPnxjFLVYOyZXyZCokC
 K8U1UfFvdjke0/rBTigtLJ62gF4528qScIdDjNm2iDx1pobBO+Rt+vr9Q4ocmkzHytGiGInV0hE
 E+GDK2Kmbg4kHaGGaCg5Db5nBS7N/+/dTmGH6fwuGR7B/zIMFpLxIU5VX9NsCRD+W8hvQz/HS1q
 D2glSLOAYKYl2GmB3FnxdUhvKo1Ijs9z2tycEY4FDOrlVCR4Ywf6PCPPFxAySpTljTvg6Inm6qn
 IEDkHBLBIdi3d4F2/Xg==
X-Proofpoint-ORIG-GUID: zapMWRehxK3NZivmAMsva5_ZKGB88Acm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_02,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250034

On the TFE (VFE 340), every buffer queued at runtime is followed by a
register update, which makes the hardware raise a RUP_DONE interrupt on
top of the BUF_DONE one. We therefore take two interrupts per frame where
one would do.

That register update is pointless here: the TFE bus image address
register is a FIFO and not a shadow register, so the address written by
vfe_wm_update() is picked up by the hardware on its own and needs no
latching.

The first patch replaces the sequences open-coded at the three call sites
with a single helper, which calls addr_update() when the generation
provides one and falls back to reg_update() otherwise, all generations
implementing the latter. The second one implements addr_update() as a
no-op for VFE 340, which removes the per-buffer register update and gets
the TFE down to a single interrupt per frame.

Side effect:
VFE 1080 loses the register update that used to follow each address
update at runtime. __csid_addr_update() already writes the AUP mask and
then the RUP_SET trigger, so the latch should be complete without it,
but a confirmation from someone with 1080 hardware would be welcome.

To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
Changes in v2:
 - Simplify commit message for 1/2
 - Collect tags

---
Loic Poulain (2):
      media: qcom: camss: Latch buffer addresses through a single helper
      media: qcom: camss: vfe-340: Skip the register update when queuing a buffer

 drivers/media/platform/qcom/camss/camss-vfe-340.c | 11 ++++++++
 drivers/media/platform/qcom/camss/camss-vfe.c     | 33 +++++++++++++++++------
 2 files changed, 36 insertions(+), 8 deletions(-)
---
base-commit: 2ad58ca589da80990b7afbcff018777851577f89
change-id: 20261124-tfe-fix-irq-eb8fd293791a

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

