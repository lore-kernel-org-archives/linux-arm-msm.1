Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794987918;
	b=CvamR15t2P8m5nPquBQsietgkIq3FKFZ0tbFmsLsgwAooGgmPN6WRmqD7DHitedL3S9w
	 AOaEW6siHlT5Uzfs+fGjtaoQ8vBntZWAy8kJNG+k/d22zDUCe/FAEv3kp5aln1lkdhraT
	 jqRzb4739b9kFqfEZwAejhULKlun1yI21gYTCJlQZLogHeSh1TSJ6KYMHFbUqyQxqh6tN
	 V06XOA4rcx26mXrZkWyBIw1h/ucOZERg7wmZq+lDwJ5n1Xw1uup4lRGImlxnhTWuSDr9o
	 NUrRo+yk63itHOSso/LiXJRH7KVmRcD2/f2pnqjvG0QHH+P7FACUy3Y3Oa9lhNOL85g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794987918;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4WBBb0I6dyAlCFoWxx+e24C5IpTXp7T1rNqFegTsV1k=;
	b=sbE4FX0mMO6Z9QadJwOw9RA1+b6EO6/pByOwr9jCQVnHsjJqpETsEJa086rT6W5yn7tc
	 qzG2VQppyYbEKa6KYXhJN7KEwXTRC9ma00CCZzD9Uq54hF76vU6j0uKTsYhhUD6JzovrG
	 8QN/j31JgQ5ROv/J69XAOOjWZzLCbqQHTkydTRjiZ5TUPi9UViTK85qTC4Otdyv/YBZrG
	 XHDSZhL2Eyutd0WWaTikRdbrytNYbpfbiVQkQP7dqtnPlQHwlH53G5Q+hccqEBB5tVouW
	 6/APMt91XquySTeaZUv70KkMqS9d/+/IX7umLUtcaKq2HGWx3/URNk8+1FlNBLDLtlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDBXS+Zd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjHQv6Da;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB31606A32C
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CB31606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pDBXS+Zd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YjHQv6Da
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI2Uuvo2453530
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=4WBBb0I6dyAlCFoWxx+e24
	C5IpTXp7T1rNqFegTsV1k=; b=pDBXS+ZdzTiNwbUvnd0za6MJiT+Zkf3fv2rtas
	NfDA951LeQxTai0tWp2tGKEg7+KA2RTawS/atw6Y7StV3WncU8OssfjdCUnSR0O6
	aDoidUBLbnp8yJrVR7KcniIg+VQTPLKhynNlwlUQLpjTAvIZsJN4EynFf/Gouoec
	lheGjQHUYp3IKnS5ijKTarSqIgaeIAFqfsMp3b5toZmWipK8+eWrnk5PaB68Wuoc
	PtW3X4vilWhHGzHFdURBSftEtA+8WWxNlyYH9AFZNQkLWGB6vEmpFQC2sdkXKSmK
	lt37oV4hOGKQIlTYlvJjxeiREBIdSydabTnd5FqW1Plo/U4A==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv99ug7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 18 Nov 2026 07:45:16 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-9495c71055bso154273785a.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 17 Nov 2026 23:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794987916; x=1795592716; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4WBBb0I6dyAlCFoWxx+e24C5IpTXp7T1rNqFegTsV1k=;
        b=YjHQv6DaC6+uU94N6YJcKfBnIWypmJk2H0u5pZs88VLUAJXTdFOTQ0eitRz3hqy+R3
         r6d1Ym9OffUteOEMqfSz7Xbh6t6ExIPhWvvIUzJDhrWalwVJtYRQXyfO5O0XcTRL1PNi
         R26eNeevXYZT+kVYxBQced9VELMfOSpHP5QDtmC4XOKRwMC6w+O0b0WTuI8fLzzG+8hG
         CE0ZinAcOPtvW0SgHOdR0JOAcVwhVeoR40RNAKWbed08uj8doqNo0+4i6spdiPJkZDdl
         7UGlJZpWSuIH2xu8CPKKr50hMkho3ESP6J7ov8TC76+76uHyAgY9PvwpZGUOK/cBgO9v
         LGsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794987916; x=1795592716;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4WBBb0I6dyAlCFoWxx+e24C5IpTXp7T1rNqFegTsV1k=;
        b=QOUhEymPnY8RwMouETxI9R4rm1Suj+veaji111clXZAlQs+jMgWAMezcw0xS2tDycT
         ZYtPolWpiqMpToyclKw7/AifvBpN76DKTT6RuWu6t4aLS445Im33rPmOFVVvcyLtfGNC
         43Ax6Od1Gr0C4+z/+e/+typR82BDcItJpVFsAqf+78pnvbQZnzv0h9eh2bB2ZcAYZjxW
         12j7erkodOTP4s8gOS/N4cjUXAa+B+J8+Tx7IfWYY4//daWJCochzIfrCWQKi0EhWjkc
         iCkCLHk4A+bWs948ESiPacWPAZvM8cVEL0MG64Nkh22L1fqQ4mWZcddrETS82UpHEhx6
         d6DA==
X-Gm-Message-State: APuU4Z+z/XfEREJRxyODOa0Rp0Y8TZDqL7mx8BLjo25W3uAV1O7J7G1W
	GcjSioDi9kSGjPRf3sIl+B9doZFz/xZ/KB7zlJ6gMUXzvXNpSnonZK4VIKOYEFI5AVbij50i74J
	ZbNixm2SzxbdYFlIYmifrya4ie52Nqkm07PwR2MZZNMYacJtW9MvoTQzZp5wDHiO9tU7w
X-Gm-Gg: AYBFou2Ky3nNCZlApNyMyKM/ICHwooZTTPCh86nVBZs6A8+8abtlFhO+ilNnIUf3eLI
	BzfFbwb0opk8C4raV7o5hP3+LvhItg1xZkqQAEr2poj1XzAK0CmqXpTwZrdqyR6wU1f2IkM0YxM
	nw2KWD/Z2TjZscnaIeeKKW32CuqKQ2L5GSExOxgEc+PeOu23WmSyTVzc7fHvE0HHKfyyhOyXV2X
	8ye/cMWBgGm1ba7esH1tQxA59JnjAqoqWWD8WfnRYtXbI4m7UHBT0S1RYw+zPEYG79+ohPT7AcN
	EepVvs3ke9zoadd+5aRRqeh7BuC/A2X+oQD676zUPNkxOJjqJeElWJKXIlnC0S3/ulN608jW/Ha
	N0O/xHudPKAzjUbJ9G0vnRJXondZ/fQLbCEAiRAmMrxeJbTvMUdQbfmRia/z0/sfpcOnnAYehSK
	z+ihEW66tfdKFpI4mUUiMA++wrUA8iCfifPqMCKGjL
X-Received: by 2002:a05:620a:414e:b0:949:6d95:f63c with SMTP id af79cd13be357-949997accebmr349786385a.56.1794987915670;
        Tue, 17 Nov 2026 23:45:15 -0800 (PST)
X-Received: by 2002:a05:620a:414e:b0:949:6d95:f63c with SMTP id af79cd13be357-949997accebmr349783285a.56.1794987915246;
        Tue, 17 Nov 2026 23:45:15 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b7b8444sm119359085a.31.2026.11.17.23.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 23:45:14 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Subject: [PATCH 0/4] camcc-sm8750/eliza: Declare interconnect dependency
 for TITAN_TOP_GDSC
Date: Wed, 18 Nov 2026 15:45:04 +0800
Message-Id: <20261118-camcc-fix-v1-0-279d269e343b@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAIFX/WoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQ0ML3eTE3ORk3bTMCl1TUxOLFEMDizQLA0MloPqColSgMNis6NjaWgD
 i2r6rWwAAAA==
X-Change-ID: 20261118-camcc-fix-5548d108f801
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794987910; l=1793;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=YpJ9h+2mMxnlnVuRnge669rNTg1uDWzY0NDJg7m8lrk=;
 b=dcGVPq/div3iZgu+WvV20jvZqyoVTf6Z1MSJVkjkOoGEgBmpF3h6UxU4bt6MZkp3dMyo9B3TB
 U8mt5ZamAdqCEo/JOn4KiR8mB2GfC//UKUSOUROuqEt7N9d7iWkGe5G
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX35FOEctvGcDc
 HYVLeBxYu0iG5kUR7emLtL5zAvdnutsd4k09svkGNUVfV2YLQWnmmf9KFq49B2TbBAPPpxBZOLr
 Jc6xag8gd0iEbG0nTNjC29X4xC66S+0=
X-Authority-Analysis: v=2.4 cv=acT0Dhot c=1 sm=1 tr=0 ts=6afd578c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8 a=7Pf2AV-a0Mu3ELrywaQA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzMCBTYWx0ZWRfX+iO8mnLJd22E
 GqLrF7Ep/5cof0dUshqrbraz1H5ntOMPwqrbG+H/tBUdy6ZUfGeqhcCtHgOVNC5UTTX7v4rJdYr
 WYIuHxym7P2lXeu8omE9wovAAxFx3HVAQJfR6SjvUBGNKYvPDoGTzHWQKbt/MSreCS3SMc2vBbw
 s5MGpLJKw4DeA5NfZ+QCGyxLLtXSMGjIUw8p3Cg9d1z2+FT611ig11FrGZ+uWhvOEkI8du0uwnw
 eb7d7v1BXHOW3Irk4o16Pvh610rcBEshHfHn3tMrRdiPLDwmfsuxDmBOHOzBaBXGNUWG65XMx1c
 flJaKk2sdYUNwPQ1f+VTF9S5MsQAbYML7nJwnwX/uzdGgQ4M1TH5AvvgP4DDhO2GkKo5aPyJdM8
 5T84wyX7KaCfo/HYBbVbpY19cX7jn0hXgLoDOoa+hiskuY5113bNMkOOy4SjPgyR0Q1A5vVDufp
 5G+ornqEsgxOReMCaVA==
X-Proofpoint-ORIG-GUID: DgPp0Wm5rmgyOj7_ZwXxFcfqsn6vlfbL
X-Proofpoint-GUID: DgPp0Wm5rmgyOj7_ZwXxFcfqsn6vlfbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 malwarescore=0 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180030

The TITAN_TOP GDSC hosts the camera NoC (camnoc). If MMNOC is left without
any client vote while TITAN_TOP is still on, MMNOC attempts a power
collapse while camnoc may still be active. The collapse then gets stuck,
and so does the MMNOC BCM, so any later bandwidth request through it times
out in RPMh:

  Error sending AMC RPMH requests (-110)

This can happen whenever the last MMNOC vote goes away while TITAN_TOP is
kept on by another user, e.g. when the CAMSS driver runtime suspends while
the GDSC is still held by the device link during probe.

Fix this by declaring the interconnect path on the TITAN_TOP GDSC itself,
so that MMNOC is kept voted for as long as the GDSC is on. This uses the
GDSC interconnect support added for the Milos camera clock controller [1].
On Milos the missing vote prevents the GDSC from being enabled, while on
SM8750 and Eliza it shows up as the MMNOC collapse getting stuck, but the
underlying dependency of TITAN_TOP on MMNOC is the same.

[1] https://lore.kernel.org/all/20260501-milos-camcc-icc-v2-0-bb83c1256cc3@fairphone.com/

---
Wenmeng Liu (4):
      clk: qcom: camcc-sm8750: Declare icc path dependency for TITAN_TOP_GDSC
      clk: qcom: camcc-eliza: Declare icc path dependency for TITAN_TOP_GDSC
      arm64: dts: qcom: sm8750: Add interconnects to camcc
      arm64: dts: qcom: eliza: Add interconnects to camcc

 arch/arm64/boot/dts/qcom/eliza.dtsi  | 3 +++
 arch/arm64/boot/dts/qcom/sm8750.dtsi | 3 +++
 drivers/clk/qcom/camcc-eliza.c       | 6 ++++++
 drivers/clk/qcom/camcc-sm8750.c      | 6 ++++++
 4 files changed, 18 insertions(+)
---
base-commit: 7cfbf79c66c63e807ea452abf0546e6f6d6833a6
change-id: 20261118-camcc-fix-5548d108f801

Best regards,
-- 
Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>

