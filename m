Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA8DB42885F
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786440216; cv=none; b=emCfkVhTPHtzWI73uEJhHDs9md1iZx7b+xg5JHiORyTr+1pboc8cOW5dBJw311f/HN3kP5TD40Pkv1LwCC36bvJpROV6FReTNdz97w6Ngxorg90gu4DjvQI4dMRbclIQSeMNluvTDnDZqzwptH3ORBTe1qilpYZiHuUhXEM2XIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786440216; c=relaxed/simple;
	bh=nNd1sHw/pDcljf6WEYttK0Wj77QmwhxMR3bvc97UrYk=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=A7iuc8138zL7yaQ2TqegTghRsFYCUSzPk4/s1PCagO/fcsOwMGEGizwxWe9zZpQdOD6RUWLuFBF/1EtDDDBwn8wWhS2CjZEAHEto5XJMviF+Z1hEuKwymc7hkOCE/gv75Xhf4fai+LIWXBu2IcHX8ekYPHXOgqrCBKcQ0IbD25w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CC2/3C9P; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cRg1egoR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CC2/3C9P";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cRg1egoR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67B78Vpq2706098
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=cwcpxYnXdMKdVSP39ZYLzb
	xDO+iMb+EToEjccW7X4h4=; b=CC2/3C9PQePyjFas9UY+cdOygalx0J/+qso0zp
	w4ZysmKWTJe621n5uwsG8Qv1YjguX+9mHzCj50x8bqVxN4zyOhwl8emTREjGbeH6
	jcrJXmE/uf5op98zjQDZBLt27EQ1SHE7q8LqxsCSGDdJdsPq5Fj2HHb6ga7bbW2M
	aDGE8OrNXjDLvpngS1yEdscWVsE3cJ5Bk34Tz3BW7utyu/rPXRtbxrSLB7SW4Wxf
	W5F1wNgyjQbRgVRhoG9Ggt6+xsRWXZY1DfUffbEFHnzbO9fxU2bGLqg/eaj8Wojb
	8JqCUfgEsmCtXqkZ5y8cw7lrlb2FCdtZg/N5QH+UDuQz4u+w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyjk63d8r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 09:23:33 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-388cfc4848dso4503810a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 11 Aug 2026 02:23:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786440213; x=1787045013; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=cwcpxYnXdMKdVSP39ZYLzbxDO+iMb+EToEjccW7X4h4=;
        b=cRg1egoR6ZrEu551S7eAc3+lwKpzK0dD30/ZfYH9RcOjUKB9pkkEOGAeLSFzFi9ncV
         w9z1iKfq0QT3kAJqwQ5RpygJdzPCDhjoKDY4wlEvTQmXYD1qmpUyayRipA4FpJh7WmyV
         6v4SRLk816ohaLGpb0BhhuaxxFJ9p0EzBsLn0q9t0/XDaLOxkLqa+xcM/251+0J5UK1Y
         kieNHkmXYt/KUNc751EqZJYi7Ar/O/V3LT4HGpFCt2p7UXCwJu81f81M8kr5EZIogJSN
         NXUutOdu5dCc1gv4hWaOHovfk14eu72mab5uGc6v126H5ESHBtGO+KuxcOIBOtndlqrD
         e9LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786440213; x=1787045013;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cwcpxYnXdMKdVSP39ZYLzbxDO+iMb+EToEjccW7X4h4=;
        b=n+buflB52sMcBQ9chFGROLs2j2bXI+c1lp/VAbphFXlupKWX0CGT5h51lZ2WJtrWUl
         R+Y9qVq9GK01JeKkwrc2ylwTjw95ht9e6Xxqq751QGk2Pagd+4ysru6iz3VYmDn40mZI
         2CqutN24MC7lPwq4BbnrQMyAG7Mb40MNxNrUpg1p5HsNjJTRE/ftYZh+/hmzNgcGPN2Q
         PfUWsJt3RCqexW+Cm7SWdL3Ie8nIh5JoBILhTWbSwSRU5igEEgAgr//FnbjuGO2VM4n0
         R3uniLIgViG//kbSrzApyqqeUDwVGmuIax9Bi8S/xShuNWMVheUoDNczA3nbCCu4jk60
         TMnQ==
X-Forwarded-Encrypted: i=1; AHgh+Rre32bQgbxr2Sxc/ohe24ygK+NPHn0CDA538H8epIIxG+M0nul1lBEe86tEjUT8TWrDRq1WvouQY/9uSvYf@vger.kernel.org
X-Gm-Message-State: AOJu0YzVSfcYYG/cmSGcyXFBXKmHls0UXj9xrSuhCrnVA9OhnOs4HJam
	BFo4vMCjhMyuuGP7dLJC1ud52ga6F3g+FL2FrueCejvsubJkZNLczJckImK25JydHIhFVKSfdcq
	JhN5CWsS2M3u2LXflBbFg8Sz04diX0AOb6IdhH+fYqqWjBl+SLntoA/vZ+J1hC41th9uh
X-Gm-Gg: AR+sD10EG+ga5Gr0QQy7m6eF/yYw4vAfRgS/1vlIbZp3zKNu6RV9Z0Cmu4+N3vYMfCy
	ssuU6qaozuxlWVkZTyq55cuZaxGZBukdj4hU/GJavro8/khlftFvxr8UmECfGOuBwpQqypCBqfV
	hzZvNZ1n9gSGiTcAqjZ31lhWcXQQdXDWq/WbfWFPywLjxnSPO7EnAkurOnLw4MeBhzwbuzOqNmK
	cXC1BIE/k/mA41ksGioh+yFk6YbTkQdvnvw/RY6MCTRmEo7xtkvN5tRt3OBnvAMcom5HmoNyoNl
	yGWoU19y9wPhq4XhbTe9HENxwAPDySqw5hOGcxkQq0g+dd2AcPfJ/6ggKwTDTO4X8Q4X6uNvpR1
	9GLQjT28279iQqdQlKyAIXFeXwyxlebw9dRaoOAC2+wZnDqWwEn1kfymngVmmrBf35E238Lxc29
	4kqbkDDxm/b59qX/5Zxw+y+yNO5VYRH3R4nGg=
X-Received: by 2002:a17:90b:288b:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-392ec68df93mr1949826a91.17.1786440212864;
        Tue, 11 Aug 2026 02:23:32 -0700 (PDT)
X-Received: by 2002:a17:90b:288b:b0:38d:f94d:4c6e with SMTP id 98e67ed59e1d1-392ec68df93mr1949767a91.17.1786440212028;
        Tue, 11 Aug 2026 02:23:32 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14120447d8esm3385004c88.14.2026.08.11.02.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 02:23:31 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH 0/2] I2C SCL counter updates for Qualcomm IPQ5424 SoC
Date: Tue, 11 Aug 2026 14:53:15 +0530
Message-Id: <20260811-ipq5424_i2c_scl_updates-v1-0-bddcb2ceebda@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAPqemoC/yXMQQqDMBBA0avIrBsYgwbtVUoJ6ThppxSbZlQK4
 t2N7fIt/l9BOQsrnKsVMi+i8h4L6lMF9AjjnY0MxWDROuywM5I+bWMbL5a80svPaQgTq4m1613
 AtsdIUOqUOcr3d75c/9b59mSajh1s2w6ee01/ewAAAA==
X-Change-ID: 20260808-ipq5424_i2c_scl_updates-f1696a0590fc
To: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        Viken Dadhaniya <viken.dadhaniya@oss.qualcomm.com>,
        Andi Shyti <andi.shyti@kernel.org>,
        Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Mukesh Kumar Savaliya <quic_msavaliy@quicinc.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Authority-Analysis: v=2.4 cv=Nb3WEWD4 c=1 sm=1 tr=0 ts=6a7aea15 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=ZOKYLu___qOWv_Z2YtIA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: D92WkBdDqjWy61VD9fqBJwcFL8_U4TlH
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDA3NyBTYWx0ZWRfX2Nx6HY2t7R3m
 42h0x9zy26pYxjz11Iod+o1azPGJ+Y2b1H89UxiLwBDcP4u7eBQ1x4wvcuACRD0RrK42pcwH9pk
 ebQa/WclLbSn95Nz3TZeK0LxOBQVkaA=
X-Proofpoint-GUID: D92WkBdDqjWy61VD9fqBJwcFL8_U4TlH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDA3NyBTYWx0ZWRfX0l0jD/2DifQT
 ttX1AxapdofYpi+LgFUNNPKKV64c4UAn6SVmvbg8dkoB6WnKT2/fdM5+NWlunsW6orTkPcp4imK
 Omwv5l41M/ImIIr0QKtcCtTZvhRem1GCn0x+GENZ/n3abU04+aoycscdnaKSf24gCxbWix/ORsq
 R5+l5BXp6DwW47/+FEDECPOElFeXfKypWGC7BWxBSYDYK5YYSZPSL96ACrlwCl5wI7tl5WzguI2
 b8+FRkScKIdgQ0JzejHYPivyvZSmPknKYDvgdQDD4y1SIymTQ04WGEzzgpJ1xxUfsVMMHOOwCwG
 UOoI9+qET1QdLl1B0vElITFpil40ihFuCocApqtn3+QWhm/tWAZluo4dOTzXa2Au7SHTV2ubfK4
 JYxPLTrMsF7KH4KWr4hATA/JLnhf107p8HZjZ3Ck8BL4ffQlouOE/x6PIvU0mPlYgY0JQ4b97UD
 NpGTLITWHjNp4t9PU5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-10_06,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 impostorscore=0 malwarescore=0
 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110077

To meet the specification requirement in the standard-mode bus frequency,
update the SCL counters as recommended by the design team.

Also, SCL counters for the FW based SEs are different. Identify if the
SE is mini-core or firmware based and chose the appropriate counter
values.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Kathiravan Thirumoorthy (2):
      i2c: qcom-geni: update frequency table to fix timing parameters
      i2c: qcom-geni: Add I2C frequency table for firmware-based SEs

 drivers/i2c/busses/i2c-qcom-geni.c | 27 +++++++++++++++++++--------
 include/linux/soc/qcom/geni-se.h   |  1 +
 2 files changed, 20 insertions(+), 8 deletions(-)
---
base-commit: 3d08ff75a47a3e7e2ab45a3bcab6723b4d906422
change-id: 20260808-ipq5424_i2c_scl_updates-f1696a0590fc

Best regards,
--  
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

