Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794907952;
	b=UAs4OPxk8TZDnENM4fw5BjzWELTK0EpbxwuuOku4MM0pPRmT7CaqPvjQvQZABJAzCkw3
	 8Wp9JHTQqVDissvIf723dBZ6Qmzh+sVbrG+6ZEjqSKiZTv0UkIur8PgZcYkSwGOyJOYTN
	 fZw6pE75tw2pdG/tA/7yCn1Q4nD0GSIGDagVCWkTirrfNqm97dXl69o8GefZTxjDga/aP
	 j2emILwDQBzpsDZEQyDfbCKdgEz4KJdiMRlwHc7Z99Dz1Sq7NUZEldJdRX4u9iMFid/rz
	 Wse6ioefWpuQu19ZHpdpvf02QHmWlNDJa61VxuYbs6jkGYmfXQGWoVTL3ILp/QCQMgQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907952;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=7C/Oh2qf22t97UvAJSPDBdguvzEAFhAp3zxPE4qLodQ=;
	b=envR3xq9rNnxIN8HyxlD4IKaeERm5ys2EaSDSKn244DrkOT709Osq4YVTO0NHOZE3ZBn
	 VcLyQxE5th+0iLOvrjoqu8bmue8cidHsCcwIJFj3CgP929tXwVRhCzYadN7WwIMdrBl8f
	 KT1mg+hGzYHqfFpQB7QDYL5jQRmlD0BQ7fFe4gVGlJsCwqNM7tNTplpiEEhKF7RqpOiW4
	 DsUV0XpEVll+7dCpp5p8Qa7ijrffis/aHgmrxi2pIHjdnmLa2h1F+mjA9BBlVMg5nydt4
	 LrpJ7z8giyJGQNqDYg8srF3kHVDRu9VNR0RBi+GkoSrtnqfZvf+xx/yub49bzHMHbTw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nR9yABHM;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5y93Mj5;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 908E8606A335
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 908E8606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nR9yABHM;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=C5y93Mj5
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AH6exIc2998599
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=7C/Oh2qf22t97UvAJSPDBd
	guvzEAFhAp3zxPE4qLodQ=; b=nR9yABHMfzSmZmqLcJddGH5GQ5dbN1wx5/5WPQ
	D1ghVT/+9ScGKQtj/A2fHmTfLaiUa4itv8LXFJGZ6Y3o18yOjQgFt8fFBR04cQsY
	IhT+0LymkO1bltd4jyxUvdKUdRC5QSnokTWcGJmuHww6ub643N52zcYLifMaWdGN
	dgd/d9UzrsgBRlOvpDFnxlFs2VwPsBo1QZqqM2ApVjBePXqV+mekpA0f0RIy+INp
	oRwQAWYS+CzLnnUd/0+RKDR7DU8dFviZb9xZIZjOwFoucBpe016PXrjy9/fFr71P
	3gw60I2vxFkN8iH7kQVVKVtJ+LjSh5v8tcUuttkMML6anwYQ==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0hve0paq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 09:32:30 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-47cfa971c9eso912572fac.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 01:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794907950; x=1795512750; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=7C/Oh2qf22t97UvAJSPDBdguvzEAFhAp3zxPE4qLodQ=;
        b=C5y93Mj5WRY/BGJUQQWIHLYfC+f/P/GyxOao4/yrdIqSaCvqPI4f/JGec/efXNbVmR
         goZP6E11uwLn9n+tCJoj+KhaLLw2egztjpDM9TpqMOcZOUWXdl4lBbrwbhHj4NTN04jw
         7n2Hn/bwYy5F1qdK3Xy88E2F3mg0J7bvLj0N0LEfnEVCp1cI7UkRQxwpUtRJW4nxJw/9
         0xCm5MYXtuuTbzuSpYo9Ii09Wi0fI1aUziS2KfiwMZoHlDJJnEQozILq+aAV9JW0aYVj
         wfQeNYxF+J42NH3xtnC8Rv7qochh0kJTJ4ZBLl5VQd6nbGJhrLwlEkOLpGkBeU1vxBVV
         tpfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794907950; x=1795512750;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7C/Oh2qf22t97UvAJSPDBdguvzEAFhAp3zxPE4qLodQ=;
        b=TDRriVEWzKV+2YpsBOfXYdA2NLitWr37ys2tzXwUdHWaAKX+dc/OXF0XHhBMfAolyz
         WR8JUo70u7PWEaVhw82kFMojNTnt5QTDFuYxdaxmbgSG3x6NRPcwzNmPTrNUBcwmztTO
         C+LmDT2dxftfomCIHX6+bMEqaqisst6j0Z4/OvTDyMEVxb8tLppulXHUTXMTMfPLUSnn
         NQDCS5Rmp59vybDKxUUFawoqeRpcPVjxmJeX/zCfymSfb6pvrxU3alDJn9kqUvkIPdwk
         CNx6Sf6Pp1Z4/w40oX0gmxsopMTmmaC0j0mzyDmVHF0M1Ix+OVKuATuElZ42Wp62Aaho
         GsVg==
X-Gm-Message-State: APuU4Z/iOr5P02kBRhbmoRPxKEr6lzUC6gihGaogOTSKbNvnQT49Q5H7
	5BxzlNggOfG7LdjG+DFd9ByYjsUYqDO0SK6LnO14CSMoW0bJY/XMqUxXf0hfhcxH8N73tahBSvc
	oJSxw4vs9D7hClPRJGZpZ+h3ba3h8u2IMT7c/BLkJzYvdBxO6Lrv4UfgwudhnQthTxHwE
X-Gm-Gg: AYBFou2GXq3OeFc4Vg4jZRmU54czT36ZsATzN7M7H+VyEC+xWbXVf0Lx6LcdxZ+1Flo
	AUuEmBzWc6x2sHYc1EF06Le7H5OyM7Mm8Ci4Tqou3lDLr7JFvqSOWi5CJjSm9DMNsW6UzvAb4Bf
	W5fXCGYZ+WXnCxM69ySdYQs8yMsf40fOCtTGEzY56BmBgWNHVjRl46KkoYmDAnJVOTfv9d/ZbMi
	KoTHZy+AErmh+QkhqQLp0HoxIU0ypzD33bq1SRnHwzonQMZYrll1zhJNVht6WTjSNJfw5qxGUJ4
	meyuzm/PffkY4AcpwXtgm5a7k0EC0B0LHDxF648ymRGlBnBo/2Iy2JD0Kr49fUx4w8muad1Kb/O
	tpkt09iCFo/moTXLVOcMIa92iRIHOsPG+SYFqgUnT67fKpWGqonClSmjRJ8peUNq4gK6529kYMh
	sU2zeJJmeExKSTuEAAOX8sMdLc
X-Received: by 2002:a05:687c:22cb:20b0:4a6:d645:94a9 with SMTP id 586e51a60fabf-4b40afe2b06mr889006fac.4.1794907950009;
        Tue, 17 Nov 2026 01:32:30 -0800 (PST)
X-Received: by 2002:a05:687c:22cb:20b0:4a6:d645:94a9 with SMTP id 586e51a60fabf-4b40afe2b06mr888989fac.4.1794907949550;
        Tue, 17 Nov 2026 01:32:29 -0800 (PST)
Received: from hu-fenglinw-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe2206dc0sm8678928fac.5.2026.11.17.01.32.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 01:32:29 -0800 (PST)
From: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
Subject: [PATCH 0/4] leds: leds-qcom-lpg: Add several fixes and the PWM
 frequency mode support
Date: Tue, 17 Nov 2026 01:31:32 -0800
Message-Id: <20261117-led-qcom-leds-multiple-fixes-and-pwm-fm-support-v1-0-7a862240683f@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAPUe/GoC/yWNQQ7CIBBFr9LM2kmg1Ua9inFBYVAMUGRATZreX
 aq7/5Kf9xZgyo4Yzt0CmV6O3RwbyF0H+q7ijdCZxtCLfpRSDOjJ4FPPYRuMofrikie07kOMKhp
 M74A2INeU5lxwUGJvjwc9iukEzZoy/b5Nern+mev0IF22DKzrF202NFWTAAAA
X-Change-ID: 20261103-led-qcom-leds-multiple-fixes-and-pwm-fm-support-3a04f85c60b9
To: linux-arm-msm@vger.kernel.org, Lee Jones <lee@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Griffin Kroah-Hartman <griffin@kroah.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Anjelique Melendez <quic_amelende@quicinc.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: David Collins <david.collins@oss.qualcomm.com>,
        Subbaraman Narayanamurthy <subbaraman.narayanamurthy@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Pavel Machek <pavel@ucw.cz>, linux-leds@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
        Fenglin Wu <fenglin.wu@oss.qualcomm.com>
X-Mailer: b4 0.16-dev-17187
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794907947; l=2405;
 i=fenglin.wu@oss.qualcomm.com; s=20260324; h=from:subject:message-id;
 bh=J0/bhp9E9zVhqWsPDFGrCuBfATDpSj5KVBkOOJecmCI=;
 b=B8VIMmvdX0xmus9xtTLOjvBL8GpGgCg9KLaGyJl3DYIe2Csl7x+vjlPejRKLGw32UV7AkFFGw
 x3nbtPfbtYFAl7U6LbY1Jz+ibAdN/uRZRe7fGQnO+NlTKDTXsdhVFTL
X-Developer-Key: i=fenglin.wu@oss.qualcomm.com; a=ed25519;
 pk=hJdt3E7o54lql+miD2GaxwF74cDyhgNwMbmFOZ46bRU=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfXyhfO44qFLuTr
 gqD9O8NE0wLJbu5ejLCWynBcLJTLBqyOetX96dsBOAlMPaEQJqeU5LeUl0C43fArM/32TJIroDn
 SdPQvZrTLVh8bXSg/B2KJZ/IBK3GieE=
X-Proofpoint-GUID: 4tv-hlm4PC7qYImsBsmpUuvObWS8okYs
X-Proofpoint-ORIG-GUID: 4tv-hlm4PC7qYImsBsmpUuvObWS8okYs
X-Authority-Analysis: v=2.4 cv=dqhOmFg4 c=1 sm=1 tr=0 ts=6afc1f2e cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=UvHhfY28hrIE04vzKvkA:9
 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDAzNyBTYWx0ZWRfX74OMjONzyI14
 rsxUWieaVaSsUfvBAm+DML62hyMQ15fT58Ct9vt+2AzQ15oYGOwKsUCWQ1fAT7Gv+oI3tDihtyC
 htxI0GkxCKFFkF5UEZyBDLelAJqZhH7guX6YhcDa3wYlDrrOyxjNszypsaYTLpZZGCsnHJWRVPI
 HWd05HopqVi0j6JvXLVuwV6+uCz0icZVo0W/RQp3q1ep6Foy84kamIyAEpPut+94g7f4KNHzUX6
 q4tiLFSjjNnm2TTe88G3ukRIbntQLyCFfiehDIh29DLh1t1civn3p0SirlKWCVCVj12AsquZrOk
 qAGeqsFSIzdC9FAFJg5AIGv7iBcjC7CgZSbcV9HXiivM75dQo44EeTxul3u2rPlnOADmQa9bIVa
 SsmLnLci5ajK/z8cbXtNvO/nYF8ViYVdZyj/Cy/r1E/Qwiy0MSQZF8fdNjOQNAA7Eu10AW5mt/H
 KJmC986f/J0y0HMZ+cA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170037

This series of changes combines and rebased these 2 series as they were
changing the same driver file. It is easier to send them together to handle
the dependency:

https://lore.kernel.org/linux-leds/20260716-lpg-rgb-color-balance-fix-v6-1-b49d51528f61@oss.qualcomm.com/
https://lore.kernel.org/linux-leds/20260827-lpg-pwm-fm-support-v3-1-88ae5208c57b@oss.qualcomm.com/

Also, a new change is added to close the discussion in here:
https://lore.kernel.org/linux-leds/20260827133753.GM770273@google.com/

Following are the Changes in this series after the combination:

- Added changes to scale the pattern when the brightness and
  multi_intensity is updated while the pattern is active.
- Added a new change for explicit LUT ownership tracking to fix single-entry
  LUT leaks during pattern cleanup.
- Skipped LUT allocation for zero-intensity multicolor channels to fix
  comments from Konrad.
- Renamed Frequency Mode identifiers consistently from `fm_*`/`frequency_mode`
  to `freq_mode_*', and clean up the code and fix the naming issues to address
  the review comments from Lee.
- Added logic to compare the timing accuracy between standard pwm mode and
  frequency mode and select the better one.

The change series was tested on Maili QRD device with pmh0101 in these scenarios:
1. Tested the RGB LEDs by randomly adjusting the brightness, hw_pattern, and
   multi_intensity when it is working in HW pattern mode, and the LED pattern
   and color were confirmed to update correctly every time.
2. Exercised the PWM4 channel on pmh0101 by requesting it at different periods
   with a 50% duty cycle, confirming that the frequency mode could be configured
   correctly.
 

Signed-off-by: Fenglin Wu <fenglin.wu@oss.qualcomm.com>
---
Fenglin Wu (4):
      leds: rgb: leds-qcom-lpg: Fix single-entry LUT leak
      leds: rgb: leds-qcom-lpg: Fix LED color balancing in HW pattern mode
      leds: rgb: leds-qcom-lpg: add mutex lock in lpg_pwm_get_state()
      leds: rgb: leds-qcom-lpg: Add PWM frequency mode support

 drivers/leds/rgb/leds-qcom-lpg.c | 643 ++++++++++++++++++++++++++++++++++-----
 1 file changed, 562 insertions(+), 81 deletions(-)
---
base-commit: 4e88404a72e5e26720539e5555c383069cefb486
change-id: 20261103-led-qcom-leds-multiple-fixes-and-pwm-fm-support-3a04f85c60b9

Best regards,
--  
Fenglin Wu <fenglin.wu@oss.qualcomm.com>

