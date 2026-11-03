Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793679506;
	b=sHdNjGyiXfVH0JgDmjzxAGpTbeiDgCLurqEqP59BRFN0NYDufLJvu0eGxS+++9V4PmOb
	 N4jyOl+2RjJKNK2I+k275AqOBVLohDRwEm/28+Lty12vygacBIUHjsXYv6GOnw4HQIhzf
	 dmHWnYu6SlQ7zaYjoJUYsm6XUg/ev0u3/Foxnfu1rvbYoz8Ey2YZjXG4+laYwOZ3LFAz9
	 DgZ7oP1sW1CQf1OTdkLiI29Y3VB3fRm6zt2D9mgq4/1G6AD0bn02gKK3KFqi5TiKOa6RX
	 7rCXUsIU7OhmUYVIZ7QGMjUuyEPrELtjoeZVbZZPeA2E6NrFyf6gEiquhz0CpF6X4Ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793679506;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
	b=Kd2w98k/pLIj6P8CmlFYzGY/V17hi0OjoVYoiTzNQ5L0Cuvpn7vIjUftr0SaWmqdIcNI
	 8h4p4F/qTHx4S+1yBRtnRXzQBUSipnfXlWh1wrhETMkfvQdhcJqnMMzlh5E3dek323G7H
	 oz+2ETUtoEfNKzEdFgE53t5rXzOPYo1tkAQYr6KRuhsaUWfkm5K03cziJomKlkVCgBSCL
	 xXSlty3+0ciHdA5YhiY6awHhs4XTL1WlkH+jLo4iSWJbOYU8GpdA9CUdk8BQbNJIIMdAk
	 RAM3sQFMGvFowAsvF17NHF4rKJafaD7QVqmBsVKrJH61BhRCCXvuwbU07K9wY4zEOBg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8DgcS43;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B17606A32F
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 04:18:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11B17606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=MXyOblNy;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=d8DgcS43
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A31egTM4002670
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 04:18:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUX
	XPzT37bk=; b=MXyOblNyivzlhhDaxvbxapLabSSW4APLlwmdNnz60zphknHtWXP
	lEb/nG2i3qBSUuXwAO2cZc4GR4V7fvp28HvGBgsnQN7mVTdYh9qX6uOyFZOaK0hq
	fUsbpufi1B0TSIbS2+nwW3mALKaUO+P5iYbE5Yp7drdjcYOJKMnUrDFAN2cga4R3
	eeKk5vD3y+t1Tn91U1cqtOiQ3RktCSBm9uF1BjZCpiqiUxKqvf0X+F7ZTQbLelSH
	VgSVgAZCzRRIb8xospDrFES1BH5jzU3kIgNuz6Ctlu+vLsVNMj9XS1qpLJp03wd5
	/bLOo4cBVPd3fVdReK1qs06V9x5iWhWWB6g==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07ehune-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 04:18:25 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1383723dfddso507289c88.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 20:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793679505; x=1794284305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=d8DgcS43HrIhJEbDO8gFVjpL+w/eVwGGgP7+5ISwGqeJKtGzCW8/H/gNeTORtBCaoF
         vO9X5tJYHOYlz0RgORJjdw5lnYh9b9OY2Os71l8UlfDJOTQPNNR9Ba670TjL+ugVZzS5
         yFpROzXgRtaPgbdfBgAYIVviujBEk67Zrk++PA1npJjv3dulTcwy+sFMsHus7x3WDC5b
         VZNUXUXG1vZQ+fRKTH9kPiVhvVidic2WEqNI6f9ylxxRp+nY/Is5L1hRBU/mhVfIEyqU
         C3iAUoojv8DqUFb6loDOQlDtHWEHV0CbrS+XY3uKIweshGnbwfCgNLo8slxJvaX40Yu5
         NkxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793679505; x=1794284305;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tgjhSVpsh7WmEgcUKf9hKk4F8PjwpzgwqUXXPzT37bk=;
        b=gE0bpNGowoMrKR1430CmuwwAzhEQgoke42O9RBJ4/WDRcA3B0khOBeeeGlVyFLyjd6
         WEh/vyNoDs9mvLFlOIM44XcDVDVs/J+zuwm/sZKsjI2kNL7DCxvUKE5Rh3VpRMDCAaGO
         /dqXSsSBGTP/d+UFe6MJ8/dsIor3hGVXOf804n0LMwOaYCHcHoAYYzB/Q/xClqtCabWn
         uaLToX5H/PTdd5MoGOZwBedYFwhPJFSdrrScdkwTU0d52PqQzgBxvlGmSkn18Ab4ujiu
         VTtiNk2taNrGpStRj31RPdWheY0+8RvNffP2hywdo9ZqQQjozIeqzibPz4t74YJcvWSX
         ICGA==
X-Forwarded-Encrypted: i=1; AKwUvByFR4PlGP3zbEPuj4m29G2l5XBsIqfwGjKJsZur77zC4um0zZFmBlqNlrdrGNhmKfQHaaN/QfpqhprbW6zb@vger.kernel.org
X-Gm-Message-State: AFq9FYL1QdBXlKrt4G2v1udqkbnoXeyJGmitpPO9jF7GTYP3ROIJC2kW
	/lb3aN0TfnVkPQn5nYVcqQDOBanXcnQC/ELjmVa+Ft73qzuf25LReFLcNbyPP75d8MMe+V7Bl6w
	haFZ4olB+sRbfA6fD4CyJcxxgOTizWAmWlPV0P1ymAKGGjTOPC5TrZ3yXjet4fcfKRSaV
X-Gm-Gg: AYBFou0/7FAhLXg1tgS0PmRoAlp6kqrc6eE5Vv0pVSDm01MLABbDWMNMx5SHUSMIo0c
	Wa60OLXCn2/vLtXNteI/q1+Pb1HDB/IxiaujyWtknM0C03GSVCN0YZ4MSOU0tTvlDRUcQX4kj0Q
	M7Me6ZhRTrK+HZX4Vs9hEGiFsNhjnq/MY5AuH6Wr4iNRBwqGseN49+3tD4lx8c/TI7rg8NMCJ28
	3KMLs/dm45P2eBS7c0HNpgGjtFM8IrXpIr94Gwp5Jra0wJOk07vZUPTNYVibLH2VhbL7CCabKQE
	JhYj/DvDWnspXfOYQ4DPKS3fOyxq7UPBw5fXoBR8K1QDXH57rPYHKpWb1fgPx7Ax6b3CCIm5NQ0
	LqRhmTRpYD5ineFELaVdhOkCYgxHw109IQ3K/4WgDsxB0YAybtWgFVOU30z7rQjuGqIDUfrCtUK
	VIH/pMoqy5X+R12MAR2+K71wb1kaKCPk6a
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586718c88.38.1793679504243;
        Mon, 02 Nov 2026 20:18:24 -0800 (PST)
X-Received: by 2002:a05:701b:424a:20b0:148:302e:1bed with SMTP id a92af1059eb24-1ac5e8df484mr16586653c88.38.1793679503305;
        Mon, 02 Nov 2026 20:18:23 -0800 (PST)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b106edc7f8sm21701617c88.9.2026.11.02.20.18.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 20:18:22 -0800 (PST)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v5 0/2] usb: typec: Add onsemi FUSB15201 support
Date: Tue,  3 Nov 2026 12:18:04 +0800
Message-ID: <20261103041806.1885974-1-shengchao.guo@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfXzWWGTJk1Eyxe
 4d3rQZ23fd5W781N3vWx/hELhxdGD54/tuSui/jrA3CUGrRC/VrNYfcm2MXftNTvSsrA5a1zEBc
 nPV0i6mjyy6EVua6tStKMyBbh3SRrlawNbju+QGeXq0TY8VVKYHocM3BJZrKq8I/y1qe8Yj0cfx
 NJPKqp8cVo+xlUEL5Xt9FBzCf9ZLQ08kWKLQNDXHN603q+9Q4s2VBnNL9fowQ4Jk3eb3zBLooig
 QFfjiYcTicPIIp5IV7bEpXMhGE+0kXFcZQVcOB4QU7v56FTCuy5qnwxN0BmHSojSOnTrOjPX0mC
 RZo74bxivv90SgZ2mtseA+9M4Uju4PB1oVATgZpYC+omvFxm7IfUZsk61HTaKiC8RKeZ/crY5CB
 D6W1U9GzXBrkaI2D+gmRzukFi6cGZ/Hp5owib97hXjo3NS80ov6A25cbCNnOEO/Wq2+z1Uv/Kks
 Zo3MRGSyfCvYi2fI5fQ==
X-Proofpoint-ORIG-GUID: 6CEOb0njPptz7n9FA9-XwS665iX0MV9c
X-Proofpoint-GUID: 6CEOb0njPptz7n9FA9-XwS665iX0MV9c
X-Authority-Analysis: v=2.4 cv=B/wsQ+tM c=1 sm=1 tr=0 ts=6ae96091 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=R9LytnawintqPorzxAkA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAxNiBTYWx0ZWRfX7HDJYA4yTWHE
 O6hUH1RHiLmBkJ2Q2iGj2rGoXd3rgT0N+vNJCwgcz1GM2Qik1XPIOPUuhWZqpFTadNS6szfuDi3
 ZHbN5N8fx5hvcJ5vfmmw95z9WCHl18M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0 clxscore=1015
 impostorscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030016

The series adds a driver/binding for onsemi FUSB15201 which can be found
on Qualcomm Nord reference design boards as a dual-port USB Type-C
controller.

Changes for v5:
- Hold chip->lock while seeding the initial port state in
  fusb15201_hw_init(), so a data_role or power_role write arriving
  while the port is being registered cannot fail with -ENOTCONN. (Sashiko)
- Link to v4: https://lore.kernel.org/all/20261102111732.1678646-1-shengchao.guo@oss.qualcomm.com/

Changes for v4:
- Drop Assisted-by: LLM
- Link to v3: https://lore.kernel.org/all/20260916135918.1017527-1-shengchao.guo@oss.qualcomm.com/

Changes for v3:
- Address Heikki's review comments (Thanks Heikki!)
- Link to v2: https://lore.kernel.org/all/20260911073414.16711-1-shengchao.guo@oss.qualcomm.com/

Changes for v2:
- Drop include of <linux/mod_devicetable.h>
- Link to v1: https://lore.kernel.org/all/20260902045938.184221-1-shengchao.guo@oss.qualcomm.com/

Shawn Guo (2):
  dt-bindings: usb: Add onsemi FUSB15201 Type-C and PD controller
  usb: typec: Add onsemi FUSB15201 driver

 .../bindings/usb/onnn,fusb15201.yaml          | 152 +++++
 drivers/usb/typec/Kconfig                     |  17 +
 drivers/usb/typec/Makefile                    |   1 +
 drivers/usb/typec/fusb15201.c                 | 586 ++++++++++++++++++
 4 files changed, 756 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/usb/onnn,fusb15201.yaml
 create mode 100644 drivers/usb/typec/fusb15201.c

-- 
2.43.0

