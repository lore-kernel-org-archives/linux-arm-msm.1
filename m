Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794302525;
	b=aEf+IgEkFtY7mdXytPJqLoHgNFlyYFr0PWlngLKloiHEgW5Tq9O2y4OcBCOz0eU6Kk7H
	 zycSrjEu1OV+CrA4ld7mMkOWs+fXxEq2+8M84rF2AtZOVArZpgPeLQAo+g10fb0/Pf9un
	 cuZRBS6Cuy3zdS2gRd3eKVYWaQrTerbHbwz+JPvWO6i/ETWnDBHhrpK+1t3VdNPDYRNuE
	 sGveJiOU7TbX6tM/Ik8LDJ0JxnWKxEIuHaNZM/n/qbmokd7HXu6YVYf0fHRXGcz/ae1f1
	 VFHWC1Omj/6o3c2MQECiMJEjjuhESIPW3tr9EMMxgjC+8zT3VCjBLH68zvHOPB24llQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794302525;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
	b=AY6o3d+D4aAWnwSHwoeZ708MwsGgCR5uijYx1ZZglKGXSXOzr6qphqUiHn27edLkhuJf
	 DK8eGffYKvPptltjQPMMldc4qfY7bUAMlohBG4QAgPyiRlrD0EwClwNsuoUGaew/kePq5
	 5/hihDqO4M8B/pXhneNZNyyG8Hh6NpOVmKPwW8l+V0rbH8J+DCyCOkgUnmcbkZ7legTGx
	 HL9ckDXpEVjsGuarQMR4rJWfGPc4TCLw5jWKnmrRAMTzhiuxjyfaOwtQZr1CtsE6ml0BQ
	 BYqRasYzgzg2SW/qopHiceTvQhnWOAhKNlw2t/2T9oVuk7SNJ5nNrhmT3XFXTUJQ/oA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e121AiPk;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOfFfZMo;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CE1606E590
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CE1606E590
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=e121AiPk;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kOfFfZMo
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA8WJrU2833851
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUCh
	V+Og8680=; b=e121AiPk35J30TLioc7J7i0gE+kMarl+GfW7fO34cc9MUxOvx0H
	EXw967PMUZWBci80nGFD6EDdpcdbUT9hmjnZiTm6UBgsV43KrQLE0KUvr8syA0Ji
	lKaGzHB1saRo9p0O5Uaq7WOghMaLkNsY8Hk87/EvyQPNgZxDwmt/e/x8sbru4cqv
	BCBpqJ4LNUyUoVbEj68gxqS3gNrhTv/sKWFh83N3SJLbltLwJy0t7C6KLIHLqrp4
	L/9UXpUu+L1vRP7Taaxa49v4J+Z/OwLBta9fS0NPcH2DmwK3xM+DtxKb1h4JXSfG
	LVmfOeXTwrxd776VQDJq7ABVEdS8OZtTe1g==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4huyufr6qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 09:22:04 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso3306867eec.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 10 Nov 2026 01:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794302523; x=1794907323; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
        b=kOfFfZMoCDemRvL2FC3l4BxPWSjlZjCCtdhxe6VRdq+lcSeP+LuykJIXyjhhaAK0pD
         gCoDsTtMLdqZmw3AX/d7GagEinMwYJug9w6YEZx72bRv7/H55mPFVwonJ0Z/7DlCwocH
         +RbU6QppvdZqu11M16U5GCiwmBSZkn/jbdso/Yq0Rq/o2ajn/ZUpAX/LuKas4T7f90mX
         HUTDyCX1p5ZTvE0fuarYP+h+rzh41aknue09A4i5KoL9jV61MqX4d6D5yGncej22dc8N
         Ol3T74T3oHs6E8UBRVrqbr1BE6BBDyfQKHz3a8GjEvrDM6oj5xpl8gn9QeTGB7X9mzxK
         JIqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794302523; x=1794907323;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SpZwVIpz/3vpY8Qhp5C1MtGr1AmaddxmUChV+Og8680=;
        b=Mvm0DQFOrJ1Eo5yQsvz+c81ojZ9e4E3J9xbAhVduuA5dFpUZoXsG5cX6jKGWBIHU2f
         SPTgVmB3i4zxCNpewZuZOOJ2QbE13nNu4nu33ypvgVkEYT8jvTUzMraAKXPEaa2vxX1L
         Qi69q7orw3Gbp/+taa3Wx26Wba1WSIoQvs5VD0Qv5GeMnU3UuWC1f41x8lwkytqvwKno
         ACyqFyXKJSd/YHqEHJL6FjVO1GCZEyd47Vfkm9nRfpzuleLnZmccW7ZGatCMKp1xFNBB
         s8OMYCZJ/NTuLqkZijkX/7b/i8KTdsDSUyNBpV7IsBjeEABBtXrDL+FGnSfosHkGCh27
         Rb+Q==
X-Forwarded-Encrypted: i=1; AL+hErHML0AhxBZDXUDzSDZk8ZeJKTVRVrjsnNbiR63dKEgo41mWTt9UeUj4tJJfXon2wQSXg4eMrJSp7VOlurtT@vger.kernel.org
X-Gm-Message-State: APuU4Z/vIQJwP5HoBgsjUIZqnrxjoUlKWYU44A0YHyUrvWKu9vCbRA/E
	HJ/2HIhQpJlB0rB58gqkt/onh69iHZOk06ENrT4MsKy9uAioYmLfKX/seAvsPm0Ozp30DRT5eI0
	c3haejXeZ0d/Bhq9zyLccEeHbCDdVva53JgVvMA20upK+3iGVvElxU9vNzJD9JGi7+Rh1
X-Gm-Gg: AYBFou0dwAx+dINmv6WiukgnHGadtWGYcx3vSi9ZfH38Y1l8uome+XPhDS3zXFAmGdd
	O6/MMUN0jAkj20coqdkne6cTi4eZm2LQuodKnNEBJNc8DocwfKO97DgeFBAm2q86tmhihUcrLpQ
	Wj+QLFKURh7oDlwN1lUzXnHSlhDUJ1HSg88C746hpB4znjmjpqPIC6llio/WmC1iTZDQC6E/F4M
	/y9mS60Fq1muCLx/wxapPw9PFrk6MwnFBQXDDG00e1Gev4lvMwmaY4k5uhIfbPzumwxSDNkAJ0r
	SBRolW6BcUmfkDK9MFnpuR0oJXMdyYqBuBzW84hWcKzmu/3pS3MW9FQ06FApq53/mO8wV1+kOjP
	5qvBQgj1/4f4gVTIW+GG4aotLmlp+aGk23OK2WauurRD0TSflVF/z3ioJpop39EA2mSY/r2TVg2
	UcXeAhh0VoV/Akee6n8Y+W2w==
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4201338eec.31.1794302523260;
        Tue, 10 Nov 2026 01:22:03 -0800 (PST)
X-Received: by 2002:a05:7300:54b:b0:36f:350b:3838 with SMTP id 5a478bee46e88-3751fa3d477mr4201290eec.31.1794302522745;
        Tue, 10 Nov 2026 01:22:02 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-375218c863csm5257153eec.28.2026.11.10.01.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 01:22:02 -0800 (PST)
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Johan Hovold <johan@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Prashanth K <prashanth.k@oss.qualcomm.com>,
        Elson Serrao <elson.serrao@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Chen <peter.chen@oss.qualcomm.com>
Subject: [PATCH 0/1] usb: dwc3: qcom: Keep wakeup option default off
Date: Tue, 10 Nov 2026 01:21:56 -0800
Message-ID: <20261110092157.2989350-1-peter.chen@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: raDaoKQmLk2VcVNk9YKOapTiWY5IHacB
X-Authority-Analysis: v=2.4 cv=S6lMU4sP c=1 sm=1 tr=0 ts=6af2e23c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=_NthRW4p-O9EqLlfnj0A:9
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: raDaoKQmLk2VcVNk9YKOapTiWY5IHacB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfX3eUBrvvtBzgN
 Jgrcm25WCjNQpGLfTt1c2rPFVpatowLVP15rAvQFFqyuZolGb0lrVjR1nmhXSMwxuVJLHV5366D
 MYxsNpk6+uyBthKIh5qND8SmtPhcSTY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzNyBTYWx0ZWRfXyKGM7/WB+6jH
 i2yb021x2tzu4loreQwPZEq84IEZdLcrOBEimCyQKnehhlsXJTl3pGVKKvgrMvNyE9B+LFREten
 xo6fYefdIBkETeRCW+9xsZOWZ49XU0QsXN5ZeOjN54V2FEbiRNteptC8hmszLbKtm4uDgsEOpq1
 kdhNnBhNaPgbDHfGPCmQcRxSkhsDsrCfJ3WwYzQ36jFnl+mIOoHqKT8dqMUgx4ArKEPUba1cIdM
 ysblTNS5FIbOjKCPfqm/MTYhh7avWkcKJbNc4/KRwLs3cw0Bf13+69W7+KLZn+xsQuilrUp/57f
 YgV6d5993RlpSjpR1h30CLKRXbKTatOQ4UJmWvqYOHAiQMgJJTyE6ue8byW1eAarKGuQleScw7Q
 Vt+kNh0NJUDDG1JLYRZhj2ceMVJs0ypzAPdQeCCtlNGECaOvkH6vbIcyez6sZmjrM7/mMogaPBk
 9KItb024e+sfdwAUJqw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611100037

Current policy
--------------
When the controller node has the "wakeup-source" property, dwc3-qcom
calls device_init_wakeup(dev, true). USB is then a system wakeup
source by default. Users who do NOT want the system woken up by USB
have to disable it:

  echo disabled > /sys/devices/.../<dwc3 device>/power/wakeup

Proposed policy
---------------
"wakeup-source" only describes that the controller is capable of
waking up the system (see
Documentation/devicetree/bindings/power/wakeup-source.txt), so with
this patch the driver only marks the device as wakeup capable, and
power/wakeup starts out "disabled". Users who NEED USB as a wakeup
source have to enable it:

  echo enabled > /sys/devices/.../<dwc3 device>/power/wakeup

The motivation is:

- Users do not expect USB activity (connect/disconnect or USB line status
  changes) to wake up the system unless they asked for it.

- Power consumption. With wakeup enabled, host mode system suspend
  keeps PHYs powered (dwc3_core_exit() is skipped) and necessary logic
  for detecting wakeup must be on, so that the wakeup interrupts can
  fire. Today this extra power is spent by default, even on systems
  where USB is never used as a wakeup source and the controller could
  be fully powered off during suspend.

Comparison
----------
                       Current (default on)       Proposed (default off)
                       --------------------       ----------------------
Initial power/wakeup   enabled                    disabled
User action            write "disabled" if USB    write "enabled" if USB
                       wakeup is NOT wanted       wakeup IS wanted
Unexpected wakeups     possible (connect,         none unless the user
                       disconnect, noise)         opted in
Suspend power          higher, even if USB        lower, USB fully powered
                       wakeup is never used       off
Attached devices on    stay suspended, resume     reset-resumed or
resume                 quickly                    re-enumerated

Possible regression
-------------------
This is a user-visible change for existing platforms. Many Qualcomm
arm64 DTs set "wakeup-source" on the USB controller. With this patch:

- USB wakeup stops working until userspace (or a udev rule) writes
  "enabled" to the controller's power/wakeup.

- In host mode, because device_may_wakeup() is now false by default,
  system suspend takes the full power down path in
  dwc3_suspend_common() (dwc3_core_exit()). Platforms where this
  power down path has not been tested may fail to resume.

Peter Chen (1):
  usb: dwc3: qcom: Keep wakeup option default off

 drivers/usb/dwc3/dwc3-qcom.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
2.43.0

