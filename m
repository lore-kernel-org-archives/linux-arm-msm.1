Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9735549A3AF
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789983346; cv=none; b=nxMMztOafP2Yd1Jv1SJSHz4yJ1sY6wB5VLaRqi/ZvHO8RBUGQU4UOMutFB5GtHDt/iEAEP/+Kt0r1DD82yfmAE/vlMD8rVyOIkHiKEmHFs4H+XE/kIT2/AmD3yDBQ/R4bJGH/wCvJ/Cu9jMp1TxMeuTf24YqwXHG0BtpZ9QFPe0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789983346; c=relaxed/simple;
	bh=ViUeWJk96PNqJrIhaEIWN5xsXuhaArFaHhFVC6OOLhg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vEMHYNwdRUTW4tqFHE6isvqOH8FWt98CFDeB4A6bYaS4hDJ9kbfCBus+XwI0bRQbxP8gYovn66mwaSErCRquXfAUs1MSX9HlaSH3RgiCc9Xa6R2UuRrNeNRTYVO0R8mLxGtg6Bcd0JyYQo76xM2trPI/6qJtI3z1QLAYywIDTpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KFvsOztY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=a7lsuEWN; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFvsOztY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="a7lsuEWN"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L7AQCJ371200
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=mJTrOvpF8hQYLxtXvCLsRNpc5rO6U96I10x
	yU4upylA=; b=KFvsOztYpIvT7BiVlSUrkjRCgWpqbz7bevnuNrjNQe16G2UiTgH
	PZo7psoXfBCpj9WB7kWN+OgdDB7C1DeBKSUyMz5EdFCftCas1aY8ZJ3OkduKiiEo
	HnZ6nYO6PPfhc4aUa1HfFMLR+BWmQ6kYDh3YTw2dYQeGg0j0u7fab/0Sg8HxQ3aa
	WymnoUzuIjScFHkCUlrwBawf56lPMwT9VsHyxZrTHUYAkdCsXNb2udEszd3bdS6e
	FeuQkF2qZq9+DJoGGPPi+FTSorhIxHo6DbYjKO3Q77744xcxKcWOYUi6kGqLMai9
	ek7RbkSKjsdQVqA9anN5Ksicq+QM8sVsGkQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5h4y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 09:35:43 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so355016985a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 02:35:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789983343; x=1790588143; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mJTrOvpF8hQYLxtXvCLsRNpc5rO6U96I10xyU4upylA=;
        b=a7lsuEWNLlqeiim+gwnOQy5YGR1YMWLGacklyczwPXV7xJ1GYX8wUitc9BEOjEkHs2
         0C2gCnMlNJkhjSG2BZYXxpmUAXKF3unGz/wmrNbJQd0pWLiNflYxXgsyEsE/2ftRzMjy
         rf+ltCrP4DtQ43BL518FPjybeO7i7Bjzf8CyPtDygKPeDYqn4Giz+ytYUYYJ1+DtYwMI
         ovcnS85Yq5I2L0UreDkTPN/Rgwmd8mEro8SSWab6EiTLHAOXJ1zHsEi5p8mSpUe0Hl7D
         c3iP/pmZSxTzHuwiAH6HA9RvsQq00QftACuFcdScyKoiLK9PLB/fpRxk/xNNp61ubNqQ
         5UaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789983343; x=1790588143;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mJTrOvpF8hQYLxtXvCLsRNpc5rO6U96I10xyU4upylA=;
        b=Y0si3Azbq9dbMD+tQfB4ad1TIcjYOJDigVb37pkzlU1aWYJFvbf7t2SJirVQDwBV+/
         +AYRl0o0W6n/AO4hxjtTGdrbTU9pFQe0/G/ZYAWeqYf0uTsgpns2fdYVdHRqinUcrh7c
         QBS+NRkGmZn4yXuP9TsQlNA72NgFyEL0DbA1HIv0CKrpEjN8qrj0IJvXPwrPUvCT+a0M
         uzdrqVuPo94ro/sCXiMtQJsJZVkQ7rFa4gaBk6epSG2oqzRFMXni1KiYtqmK4aEoHnFo
         gvJuGeowYiTJYFDgieRy1P5dp/DwEU6ScOrMlxoMfreaQnUQNINb5CC7kbt3K8D6cbJO
         QK+g==
X-Forwarded-Encrypted: i=1; AKwUvBy+4NN+ZmqnMNaZlhnBxoOIRhOXQACZuN8wXo9E2AZTaiB7anBLAuBS0zsRauDoC5tnEsZBcsu37aN4ZVN5@vger.kernel.org
X-Gm-Message-State: AFuF++kZdxMVX1jrgJZAAFntOiHHg8bv4/J26GosIg28YxrKi4tI0TIA
	MshQqaRgFNEWWNpdqcjKWXznikH7riZe4RHm00XirlKceWG5hsyWU3zuSWHLw1tGoYsak9qjy3r
	+xHKqwjKSgeqnRtJ+dS2zYSV9yu41I63n0GL85zDVclNIYRwbyvgmOvpFhepHs4Isu0XK
X-Gm-Gg: AYBFou0xqHThMde+nFMFCETS2GF8or15Oll8n7Uozr0319P3hXal1iUGehjlfIu6r8C
	aqLdEi44Ynv/TxsD87StqMPsP1mx1LsxtOV1ysQZeCwW5nkO8a3YLnw8IxGj7KDjSN3OXzPlmiz
	U2G/hBHNjWKInEZR5DYNAJx+KgqUo2b6rfqXg9O0p2/XFd9QviS+R6tOaP2potYpkdbXfuUhVHc
	nAwUZObU2Qn1I3oqmWeznGkia9KibgMeguMDGU2SofwjWdGy7/AHP1FuH3pmdIuzoYmrffldGXn
	Zy6Oi6eBcu08LWQZ/FhSAAnvto7RGra2ntzB70o1aSW0ulLDJnUe0Bp9GvClA1uIIZQfwgg/oXg
	LKPb6IQvsj/1THiO1lEISjvjF9w==
X-Received: by 2002:a05:620a:1a14:b0:93b:d7a1:ba10 with SMTP id af79cd13be357-93bf576ab1amr994782585a.59.1789983342865;
        Mon, 21 Sep 2026 02:35:42 -0700 (PDT)
X-Received: by 2002:a05:620a:1a14:b0:93b:d7a1:ba10 with SMTP id af79cd13be357-93bf576ab1amr994778685a.59.1789983342499;
        Mon, 21 Sep 2026 02:35:42 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:d04:d483:faad:1e4e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4872456301dsm21897253f8f.18.2026.09.21.02.35.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 02:35:41 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        KrzysztofKozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-pci@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-bluetooth@vger.kernel.org, devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [GIT PULL] power sequencing dependencies for v7.4-rc1
Date: Mon, 21 Sep 2026 11:35:29 +0200
Message-ID: <20260921093529.45596-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab0fa6f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=Dtz6quo8gWpENlhL4bYA:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Y5YsoZ90oVmKK300QFRMwTcpKjtJox6c
X-Proofpoint-ORIG-GUID: Y5YsoZ90oVmKK300QFRMwTcpKjtJox6c
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDEzNiBTYWx0ZWRfX42ogxnS9nR1/
 PYSJk48GGqboy83/hZCWRRBUIAF3tEMgu+uG3Z5iO2k/fWsywSrWiveknxw5SGSywLe9W9kX7sK
 SNuEnENE8MVo/SM919+9uxb8zZ2/0ZU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDEzNiBTYWx0ZWRfX6alFb9KojeFX
 fTfcYsM1zr4RqNLosl+4lhCuW4kKAsPtlRzhcuF3myclkp+jDBacu4VAW2wJ16Fk1Aar+18ZtJl
 sXC/l9jQZ/NefWbZwx1Gc4FVEOJJ2k2lHVvwBi5sMM0HhTorPNGMvbZKh25ShbXI+BynozRSYR9
 Jb+M4f9ykzqmd4V6H18uKls6xRUMk3gyOMcIg7QF/Phc/a2mC/vuSGTyrSlvjDRxbwVhwI0AsXM
 /JhKIXqC16wjlsl1jl/0RtCWm+xWOvkeLY+K1nw392a4TSHf72icnt4TevtNebEjHK77iffTG3g
 u+hs7NflCH9YLuh6M1xRzThWWFArsztLtS30nwgaCmv9ab06c4gSYaAh+QJn/4xKZhuxzbvVjkg
 ejOhtLM/Hfi3epsQmjCf6Cygn7R2vODkMgRxdHR7SzL0+8FIZowMn/wtW2vhxruqc3cj4Nz6PHQ
 bie99gMcmedxuM5SEbQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_03,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210136

Hi!

Please pull the following set of power sequencing updates into the Bluetooth
tree to satisfy the dependencies for supporting BT on Monza.

Thanks,
Bartosz

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/brgl/linux.git tags/pwrseq-is-controllable-for-v7.4

for you to fetch changes up to 295eeaf2c6543f746c1c7d9871f6d2f71a7ed4cc:

  power: sequencing: qcom-wcn: Report power controllability (2026-09-21 11:28:12 +0200)

----------------------------------------------------------------
power: sequencing: provide and use pwrseq_is_controllable()

Add a new core power sequencing consumer functions:
pwrseq_is_controllable(). This allows users to check whether the
sequencer's target is actually host-controllable.

----------------------------------------------------------------
Loic Poulain (3):
      power: sequencing: Add pwrseq_is_controllable() API
      power: sequencing: pcie-m2: Report power controllability
      power: sequencing: qcom-wcn: Report power controllability

 drivers/power/sequencing/core.c            | 49 ++++++++++++++++++++++++++++++
 drivers/power/sequencing/pwrseq-pcie-m2.c  | 26 ++++++++++++++++
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 30 ++++++++++++++++++
 include/linux/pwrseq/consumer.h            |  7 +++++
 include/linux/pwrseq/provider.h            |  8 +++++
 5 files changed, 120 insertions(+)
