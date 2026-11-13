Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565881;
	b=UoobwvyKtMXSPyVEn4d//fhlByY1Ks4ofDxoXvzoR7dNvmmwAMpMTAlM3wnpyGe6H00Q
	 l3pZtXFnmK90O7aTKkNt2GaTIki6y9DEq0bXlUBLM2XiHX2e1pZN2/YmpL3i0WXCw5EWI
	 ItmWa16ChtsyWZ8yEbk6AHqcfNTFyLBIj+oJxHH7YKbEbaTLaNVbTwpYazvoN5ddUIr03
	 bG7JsuUjM6di110FsUC1ZBAGnC153uxp/s2ak9EsjKkxV5ozlklUCEdgaOgdoHPz4/ffi
	 mz0foEzbxC3f6HO/+l+x+hbfjkYvuYbgOuhVwMo2AAYL51VF+dreKkH63qwMPkCH7Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565881;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalBAFc4YEcs=;
	b=u3hXRdFLqyf9fsm2PBoLj6NejuJn4GfVWXFXh6vqeaFwhU9CCD2nXfSqM/KZRvAvGyVJ
	 5hjNEIikRbxAtodS0gz5xTGyuGgtLuGLnSBrrZVnCAvEdi5KpdSkMU0Hq0X856RTScvQz
	 qs6LTyu7hjwORrZtUi5av85126BT+38zz4b4WpUkS08TBV14xxhlt8BS9RWMuN3nCZhp7
	 UxmYpqm6iWPOf4NFqsxn34ij9EojVzzVNtaJSKE2efIaYb6Oq+UX/k1gs2U4cB+ACfzXt
	 YfJxV6n6watnVzgulRG6jd4ImmC5dEJp8wkKXhBC33SkWx0NfMa+isrbyb9krIyHmdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZALzFsDQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=khejRAfP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EEC3606A31C
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EEC3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZALzFsDQ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=khejRAfP
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8Uw6d3619872
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalB
	AFc4YEcs=; b=ZALzFsDQWRzrOu0/BQMIXJNbEt6+iE3h5mZEVzZ1eBmFmA/0zAZ
	lEQqEpn78xumMMLTJeJD4Nyv+HdzcfyS6PRUc01saWhR8OWI//j7FJDl5AK16Cgi
	KCcM0aRtSTCYQ3A9Z6+S4YXEPGU8O/drYaTY/TuwJeYF6NsdNnOOsil2MLiXpzcn
	tDcvkke+Nk3wzLzttrnUPluvme5yiH3lnzXlxCC+8j2jbtg3NYxJTbKAxoIlZETU
	a2GPA/cteSAXr9QDEFn/cU/sxS/UnHzYOcnGL0okQRtWqOw7Ow+J34RXjltHHMa4
	D1oixahSeIOUCJRe0C+7qh5b4tPVHqEaMZw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwvja8xvv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 10:31:19 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2eaae8d29e0so10352745ad.2
        for <linux-arm-msm@vger.kernel.org>; Fri, 13 Nov 2026 02:31:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794565879; x=1795170679; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalBAFc4YEcs=;
        b=khejRAfPNd/XOyZgTOqEQdoKdognwM4Ng79lMWl853/LiJhevQ034lccA8NiCsWLeA
         4n8Wl29vdsmPU4wAkmWFpUjr1SPMZ3TM8YRHYFXl260rctS7Hfr0+mtaSEEiMywA39Jj
         bfFfELkR/NspuPdxSQg3ncU8dYmr28LQIvLweHDu/o6h9WVf9dLgx5maSUz5U2ugla6L
         Agrh8FUFjH7D35znlMYXyuGgLb9MhbLEyAMTv8gn5+Gl1a1XjRNb9DnOkgFUt3IKxzK8
         H4p8XbgQE/xDGjWnY0uRSLwtj6MAF/7ZzSULwnctXPguq6ed7hO8d4zsRIqRTOd2S3Az
         w/Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794565879; x=1795170679;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ATXG8tU7ghaO2OKKtLwLObM9UgHsDbzOalBAFc4YEcs=;
        b=Tn7MMIFWbK6VaX/rw1aRw8Hx1xkUUhxMoVWXyKNVGvWCveEhaqtr0FCQ7GKG4w3phY
         Ncogxps6KdLvDB2SFPyzdYZtkA7BvTOAyPJnwAODmGf2OPZbd6o2qJwYJD8sm61CJMMB
         XQfi0iMi5zKc7CPH8TRmViUX81hAs8IHJvTesoeIPIo5GYiYxNQx0oLLmEuthZCc0LQF
         wfa0M0rDHYlp7HRwG/UaJwL9JMVShCq1jcbQ74tsnEqQ1pcq2JBncN/yCK2/1VTwm6CU
         CPTnXUJxp69ZTFmcDZJRuFdLXqkmL1S26FzHpMDBNOSta+PqB4zfXMAKrzmRtChMvfNC
         WIkQ==
X-Forwarded-Encrypted: i=1; AL+hErEMqPWn9mgmbXlo8/oxEH5j6dsXRjtezlY5+/5MDz14fv5VayIrYR43RHitCQTmj6YxDgyMbS9DYD8OKvkP@vger.kernel.org
X-Gm-Message-State: APuU4Z+82PIUnj+uohH1NRXkt9d7nGc+0GkaoBbF68A/RhmAg9pEZMi1
	FRyigSIv6BXWJHvvoNOMT1j8VCVdUqB2O9RNt8KpMnIjtHouK6vUZL3Zd3eCFHAY+KqvereMZ9U
	sOTlHwlyMcHYnDhrwx+oBciSzG8sdpU41yEjnQUoFDcsnlWvUSmUW8iGFzNalByp+Hb0U
X-Gm-Gg: AYBFou2sP5fNPHISRr01l+Xb+KftOtHe9lU90iGqu63exFeAhPyAjBmEsV1qOp7ucjD
	DkOC4wZStk3UDUTOl1IObhrbroWnarU2iux4cpokldaqe5lDHBw5doQO3JtyJjnkg7ZA1j2UJlU
	XaDKsQsrc072sjWPr3NZWyWd11w2vZXDXJGpWvJNXNy/0J5CRfkSclT90NV63Glkrdvm5cMZ924
	06UeJZFQdWeyMG5d4CUGnNrreEjmLkOchhElEIBMr5UK5yxurax4EDOlhIsDEKYfmpJBmUWNlZL
	WR56tgBRCsuPfW7f3ETUyGuEX1QY7AW3TJUXQikLyA27V7LQoPxONuS8RYbVHrD3bSoYB805IkR
	J2ezVpeoSsGoZuBUCYkLqTPSDvjyB7PiGlclgPhpKDdr77FtXbd9RTmQFeO2Aob4fnISIb0ihXa
	2BXw==
X-Received: by 2002:a17:903:8c4:b0:2e9:7ff5:544c with SMTP id d9443c01a7336-2ee0da7fe45mr19790235ad.25.1794565879045;
        Fri, 13 Nov 2026 02:31:19 -0800 (PST)
X-Received: by 2002:a17:903:8c4:b0:2e9:7ff5:544c with SMTP id d9443c01a7336-2ee0da7fe45mr19789955ad.25.1794565878579;
        Fri, 13 Nov 2026 02:31:18 -0800 (PST)
Received: from hu-prashk-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f8d4612sm8072585ad.57.2026.11.13.02.31.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:31:18 -0800 (PST)
From: Prashanth K <prashanth.k@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Prashanth K <prashk@qti.qualcomm.com>
Subject: [PATCH v2 0/2] Add the PM suspend/resume callbacks for qmp phys
Date: Fri, 13 Nov 2026 16:01:09 +0530
Message-Id: <20261113103111.156476-1-prashanth.k@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
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
X-Proofpoint-GUID: I_z0WIgZNQMHdU-oBVvAKgnLka42UJBe
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX2GH6J2c3PLYd
 V03H++KvbU/3SWbjlCZ0YBmEBg7dYpDybEQEnzKyw2RmRCtummMMd1Xr5VntJvwvy16tuxwzC1M
 nJhXSYSZ63Vp/UvpX+PT0dJuiFt2nxU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX+q1vTxa8lLxP
 qjcBSUituUnjOzcH9IAhjojs6mRFQRZyTCf4m1hhe+lPWyHZ5wOOu73V7Yx9bFcj2xSPs77hwZU
 uDBO8cLzIVcMIYg/woeCEMcx8VS19GSZBgPmzsK9VRjzmyr1fzmSggiaU5/Kmjm+HXXl0FSaxsD
 IqgUWv1rReoIRmpBpJLWRFCdbzylzHk3cUgy4Bh6NYv30sbPmuWUay7bmQyoSrgnXQuict6bG3N
 gC1+8dx3IKUbr+2rbGibc8QQp5xpDF5562hTELkuncdSuIm2TpJkeRfkTUwG3fQONv6lC6PZGDH
 WpTgtNdd2cw77nwYGPyknuGc1umISODqhmylKZkeXyEiVbLnB5NssQv6aVI4szf1O3Z1siHfk5x
 RJensp+ws0hfa5ZTVYJiRriyB491XBgmVSDaMlUr8ByTrJ1UTRspEWvC4qKwMn4cZooWmpVt/zE
 dzwC/7DhpffW8Z7imZg==
X-Proofpoint-ORIG-GUID: I_z0WIgZNQMHdU-oBVvAKgnLka42UJBe
X-Authority-Analysis: v=2.4 cv=AoN7T+9P c=1 sm=1 tr=0 ts=6af6e6f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=1z1NzX3wVr0-GGqwuu8A:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 phishscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130041

From: Prashanth K <prashk@qti.qualcomm.com>

Currently the phy clocks are left ON during system suspend, this leading to
power leakages. Prevent this by disabling the phy clocks during PM suspend.

Changes in v2:
 - Added pm_runtime_force_suspend for pm callbacks.
 - Added mutex to prevent race between typec/mux callbacks with suspend/resume.
 - Link to v1: https://lore.kernel.org/all/20261022104321.306679-1-prashanth.k@oss.qualcomm.com/

Prashanth K (2):
  phy: qcom: qmp-usb: Add PM suspend/resume callbacks
  phy: qcom: qmp-combo: Add PM suspend/resume callbacks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 7 ++++++-
 drivers/phy/qualcomm/phy-qcom-qmp-usb.c   | 3 ++-
 2 files changed, 8 insertions(+), 2 deletions(-)

-- 
2.34.1

