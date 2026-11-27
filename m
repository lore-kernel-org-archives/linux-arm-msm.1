Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795794937;
	b=FRydn9dSX/UxitlPchBBEw4qKY5x4Nv6bUs0X0tLxVYdwV3dj2D2jLCb6fmzXO43ml1d
	 7lzoeBYXqWLiLsf67XMGOdR9IKq8INayatACt623zml/+ptTkEgoWnhXnPXXyqCuFznap
	 Qmng/DvXer5x/1MrIykZUhAKO7FtpCOgxLUj0qtFARMhNd/ykwewpjx49nozmK99GLoVV
	 K1VIiymDhvIwg/kphOHdTvYIAnBlpkOoLZdhQjVcdde8mQq/AaphPYmumYvE7szP+o8zg
	 PgSOSFwpNDwhj4sURbm7XO/J6l2Q+g9D9lwj9gOYZxWCNJ/nZQACieIiOANbbSyutMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795794937;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
	b=YClKshUUKOV6Hv5mUxxWwN+hLMZ1YOyL8etpkP5Xr3KdblSMTFIsR0zE5/m37SqQL+9M
	 bIL88T93WdedWcDuJUgckYFKo+Vn61JEt2RWC3jzTfWQiYV0+nwaoZ/uH7PtMCalSQBen
	 mnK6GrD6UDr+mpJ5X1yAk72aa6E6ITamKaxcruGn1pmbvRvD1nGDlLpN7Zr87b2+aMtme
	 9aD2TXjQxYBPbv0PYutwO1UMpwjo3fJ/g2SraECS3m1UCJm9mc8ckMMc08OBtewR6PQ1g
	 stUdJkz5xoowL58VDY8Ku/aXhWXrYCZrjbvayjJArMy3MJIE2c/f+7TDa9swcIJONDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZawSbKF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADjgAKvC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 475FC606A337
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 475FC606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jZawSbKF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ADjgAKvC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARFpcqA2211736
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOew
	XRdZKvjs=; b=jZawSbKFspy/b3PpUj82sjpe6+p0rjAnP0sALoMHJ65gMgRvJ2r
	D/IOwEfootPLOLpQHvfDKXhn8ARyo4Rk2NNARrVaCsV9hlkLhEPC+Oc2fUvB6vQ6
	o+/AMdUvvi7d+SwsOnVyEqANg52EEB1BvHyza1ppkTG/3LTpS2WRfxlVxh+aSrAe
	lPKUV+oVc5zxAH1Z1Z1CqLkN4CIBlGrDh2MJZI5gBba2t7wba+8uzELT19+3G1IS
	PjcwcsKx3wjW7T2J/RR8XE/KveVeFYWGfjmzvanRKHIPDnxJGmvULLAgMMwdomv6
	1O0npLzgOrud/j2DipDQUSsFMD3NRzV9jDg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u55up32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 15:55:34 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93cb7f9bb86so1527772185a.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 27 Nov 2026 07:55:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795794934; x=1796399734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
        b=ADjgAKvCKK9pvqA7f2MTn3lBqDqlcfoDU95fkhrqQU3vy7GNnr1Gc4QjtTDYV0R/vP
         mWLyRiwaC3JJp1jFpC3Cm3AdN8NoLwU4VGrvj9nxDHQvsxuOFBo81h+T6dNNkDTNW0cp
         qLXNrcQ/88t7YKURzPkhV+yaf/RDpZP5cOio80SOkeVCnWl8Bo2oNadwgbuaPREk0GI9
         yatF6hzEp5z+4JOqcFh+OMyCy3QQ3cYYxIRJ1hd2mmKYqfGeOcKgRjFgfxFtn8NLJc5J
         gWbkAbAE0FXKpfgPv++I9dX+1CCSbdBL4U0kGeiaVouWEKpN9PXT7U9wUq+BOa9lEW3v
         f1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795794934; x=1796399734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xVU1rANS7TfJLD8ub6n90SmfGXHzQKgbOewXRdZKvjs=;
        b=tGjas8Ocbqu7q9nF7gasxgN32JumWkPTq6ndf//eJhJpqR4tpnTcglaWqmFmJxIXrQ
         IcnuOwAx5y9ACy07aezmHb3dE1skbUGvse/rnJujdyivwDAJS+HNAOas32qOA+A/cghU
         CPU+D+rIn0JtEsg68y0Hi9n/3VXMi7EI+/jYB5Mt1I2Wnk4a9pVSHXRfthNo3ki7sTzw
         IpFWxIzSbZ6+shmQFXNfaehIHj546XmxGXq0mULdisvsVDIV/y2jxhCpLbHRDP+p7JZ9
         Fw3bdSjQNRNXsXiBNEPZZ9CJ9Zh0cV1HRFeM0dUb9G0a+ZauNi08RbNaMosN/okkxGil
         C2Ow==
X-Gm-Message-State: APuU4Z/e0FwGVzXR4gUFAucwlp5dW65ejtKmcuWJV15KZpuYP/ds+JB0
	nPbcNVHF6cL4zO0fcqhbBFPUPDR4s0fWDWTj6WKzRWw5xLjzZmBH0yRhQ6erfCGYm/THmqo7BUA
	fHjasnlwD676dnho6M8j1lqeUZihbj5vPnhGDr6Sv7o+v8NVW9W5De3Saauh45GqwN9RsTH8NPN
	LA
X-Gm-Gg: AZFdTZeYr9QUg3Zsi9ASzQ035pz5bT0eKmRQl0a4aAA1dDT2mBLNux5ZX2aOPSZSa2e
	g2RBbgefC9WAigRZ/UXLF/zew3RfumNyDX3+iZiaPoFcgzScvH9be3a8yHwK7VR3uaZZ+e7GuoQ
	4/r9uMQFDhkqs1AGfn5wqwKsmg3YoyOcXD7Y2yG/EGnwQntFlWmZURpOAUHrRqZwQYWjx3Gdp+C
	5GhNcwHHnaIZhAXC+It3GcYY5i2eNX/BZ7LIgBqJv4/c4kSIhAns+IpDFdD15g/vfbYWp90ylSg
	hQqYEBC24T2iIsRCXH+FREKuAiFHGIuZMGDL8BPVE9u+2uJHzsCxc/Jeqev0c253meTeAQ1ztKB
	CkHUl/lsCUWgrZahoVPFqSejYYhfZClVmuvUhqsZrJBtcMQmR8xU2/ElwzHbtwapK
X-Received: by 2002:a05:620a:404b:b0:949:7c8e:1824 with SMTP id af79cd13be357-949ba95e5c3mr4741551685a.14.1795794934366;
        Fri, 27 Nov 2026 07:55:34 -0800 (PST)
X-Received: by 2002:a05:620a:404b:b0:949:7c8e:1824 with SMTP id af79cd13be357-949ba95e5c3mr4741544885a.14.1795794933890;
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
Received: from debian ([5.133.47.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm47272636f8f.10.2026.11.27.07.55.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 07:55:33 -0800 (PST)
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: andersson@kernel.org, konrad.dybcio@oss.qualcomm.com, abel.vesa@linaro.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-sound@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Subject: [PATCH v2 0/7] arm64: qcom: enable WCD9378 headset and DisplayPort audio on Glymur boards
Date: Fri, 27 Nov 2026 15:55:13 +0000
Message-ID: <20261127155520.358909-1-srinivas.kandagatla@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfXzUfTSVc5h/fp
 GMACkg9CFRnMfR3ySNLV+CaYugjaY30dSS5/tAQk+ZaYFjTcrEK+4CL4sucr8YNem96lAUEFG0n
 sax6Txv3BecGk0Yx02JvDJQYVoX67ic=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MyBTYWx0ZWRfX0aEK0R2mvsoX
 nkNpHszDzcDG7hti1XXPY4edyC2ctqFSZMDV5/vHkATLKElpGgPNk4dftMLdVBsmVHxe94sOgmr
 Eya7d+2Iw3rah09gVW51nKSee4MC36vSTzkqwzspHgl2U8+ILs1OXwpFXJ66Xbe6FYFxAKaK/c/
 1obsQIHAWzND2/AJ3IKk+gQoYTWTHE2iv1SLcm5HC9vnwHHEeMSlZ523o+GAnxpSqPp4AvjKfBW
 RQHP6lMcPVFOsBACQnypXYY9aOERZ8Ejyw+VIrkSfuWTIzpKuCYuerNlnHGmdIMmi+VXONqobkD
 TsuhuWW5XADDFLOJfSYUaGPGYToKsaM5nX4Tyad4lzyHAJqmt8cTrv0pN5cesnsq3qsgVDO0Bm7
 CsID1xUuAI7ostFQcIecf/5dm7ILZkQINR4B5OO/6PdC0rSrWZkLodyZut2eVV9O+Hum2k4csWN
 o8Bu3xPRwHOuoigtrlA==
X-Proofpoint-ORIG-GUID: qRqhJH3ZQeyBpodBAuox3KDdrR4wfdTs
X-Authority-Analysis: v=2.4 cv=Z795j3RA c=1 sm=1 tr=0 ts=6b09a7f7 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=H8Vl9kw8bzbrLTmWWJQA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: qRqhJH3ZQeyBpodBAuox3KDdrR4wfdTs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_03,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270063

Wire up the WCD9378 (Tambora) SDCA headset codec and the DisplayPort
audio DAI links on three Glymur boards: the reference CRD, the
Lenovo ThinkPad T14s Gen 7 (Mahua) and the ASUS Zenbook A16.

On all three boards swr2 is the SDCA primary and swr1 is a DATA-only
multi-master dependent (lanes 2/3); playback and capture run through
the LPASS RX/TX macros.  The WCD9378 SoundWire port-shaping arrays
live on the SoC swr2 node in glymur.dtsi since every Glymur-based
laptop uses the same codec wiring.

Dependencies:
 - SoundWire multi-master support and the WCD9378 SDCA codec are
   already in linux-next.
 - Glymur LPASS clock controllers (lpass_audiocc, lpasscc) and the
   LPASSCC reset-controller DT binding are posted separately and
   must be applied first:
   https://lore.kernel.org/all/20261125131757.1163466-1-srinivas.kandagatla@oss.qualcomm.com/

Changes in v2:
 - Drop the dt-bindings/clock/qcom,glymur-lpasscc.h include and use
   the raw reset indices (0) for swr1/swr2, so the series applies
   cleanly without the LPASS clock header in hand.
 - Rename wcd9378c unit-address codec@3,0 -> codec@0,3 on CRD, T14s
   and Zenbook to match reg = <0 3> (link-id, instance-id).
 - Reorder properties in the swr1/swr2 overrides and the wcd9378c
   node: standard properties before qcom,* vendor properties,
   pinctrl-0 before pinctrl-names.

Layout:
 1/7 adds the Glymur SoC-level LPASS glue (RX/TX macros, LPASS
     AUDIOCC and LPASSCC, swr1/swr2 controllers with the WCD9378
     port-shaping arrays).
 2/7 enables WCD9378 headset on Glymur CRD.
 3/7 enables WCD9378 headset on Mahua T14s.
 4/7 adds DP0/DP1 audio DAI links on Glymur CRD.
 5/7 enables WCD9378 headset on ASUS Zenbook A16.
 6/7 adds DP0/DP1/DP2 audio DAI links on ASUS Zenbook A16.
 7/7 turns on the SDCA class driver and the WCD9378 codec in the
     arm64 defconfig.

Tested on CRD, T14s and A16.

Srinivas Kandagatla (7):
  arm64: dts: qcom: glymur: add LPASS macros and RX/TX SoundWire
  arm64: dts: qcom: glymur-crd: enable WCD9378 headset codec
  arm64: dts: qcom: mahua-t14s: enable WCD9378 headset codec
  arm64: dts: qcom: glymur-crd: add DisplayPort audio DAI links
  arm64: dts: qcom: glymur-asus-zenbook-a16: enable WCD9378 headset
    codec
  arm64: dts: qcom: glymur-asus-zenbook-a16: add DisplayPort audio DAI
    links
  arm64: defconfig: enable SDCA class driver and WCD9378 codec

 .../qcom/glymur-asus-zenbook-a16-ux3607oa.dts | 139 +++++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur-crd.dtsi      | 116 ++++++++++++++-
 arch/arm64/boot/dts/qcom/glymur.dtsi          |  98 ++++++++++++
 .../mahua-lenovo-thinkpad-t14s-gen7-lcd.dts   |  84 ++++++++++-
 arch/arm64/configs/defconfig                  |   3 +
 5 files changed, 437 insertions(+), 3 deletions(-)

-- 
2.53.0

