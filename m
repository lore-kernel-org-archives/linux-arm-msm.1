Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB69346E51
	for <linux-arm-msm@vger.kernel.org>; Tue,  6 Oct 2026 09:14:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791278064; cv=none; b=Kj2e8LDhm89UT6biIrQ+ag3H/l50Dsar/UwGy++upXW+giujydWLvRcbMSo6a32iOANpr/3LSOnVM18SsA4dyHn+sRQadXf+yKUnxHmuhpGWfOmPXGiTx1EcXQtk6jBDRreMmoSXizPnZPLFnfB8NRHkodOhO8YA6IhyVu+QDYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791278064; c=relaxed/simple;
	bh=TFnhiszZZ5bK4CJmf443JA0CWYcIimJHjJa7vcRhbrc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=vBrj/AdMSQhDRSvwEmja3Vaph1WY8CsMZLKn3pbrABC0VHn0fGYhuszpIR3EX5sL460eDzzU0Z8z0JZfz3/M50TKZAgxGLYfoRS490LYszOM9Hzha50c7qzCQQWfoPuqoGA4kBh4N8KwpNhJfqEyJO/Pa5iPnSiZRHEKWVI3olo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LdGfH3iW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VTXqOdxy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LdGfH3iW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VTXqOdxy"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6966dtbW094592
	for <linux-arm-msm@vger.kernel.org>; Tue, 6 Oct 2026 09:14:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=hVXnSdCW5cjmKygQI5dCwG
	O11nmMU6X624qaoCSsgfw=; b=LdGfH3iWHw4B6q/joYJDlL+bB5wYXXP1dJeYud
	1Dtn+RjVFTjZzdqA4mg5n0lgtocHfADEnDKk7ZfmtOJMlXO0yWf8cc1GQVg/4zBe
	DZbuJ8AAcgorpNMUyqc9fblQSmZEKBR9e8EV+hZrbY77MyZqRQ/248ub/jiis5vL
	y5oQnpNwBF8HZ5XMyQ3wtnC6NE+O6AbYEyzmOw54qfhGfZcM+BTdY7pW/XkpD2lt
	wtAWmLDiXmlgpfKCV00ElsNCKgqBWz59yGSDO1mc92yk53hFvsWXgzkhdQ8BkD/2
	LnHUsqX7w6ryk69H0+GEZbltIYo64bYZF0x/ctUK2Hk34hvg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4gr3jw11-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 09:14:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so1394202a12.0
        for <linux-arm-msm@vger.kernel.org>; Tue, 06 Oct 2026 02:14:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791278062; x=1791882862; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=hVXnSdCW5cjmKygQI5dCwGO11nmMU6X624qaoCSsgfw=;
        b=VTXqOdxy3sybz41ZSDXyGDhn6t4QA9n6/VSVZtb8Nca7URTx/EP9TjpA2wN8YAuaDt
         yalxmgtTxnLT6Qdhr/NWzQyw5BK+pe0owxNK/W8z8DKVETOQADlnbPupV0ecakpWlv4S
         eFhEWFRBLs7bd3iOYQvSgWMLK6fjWHtpwaWFPseCXiTXePdMRVQVV0M4EfdtELT6EyQa
         JwmjjvOMrOmG9LyIQTAOWXtQKtutFCyoMJhQAdIQXZiRH7d++25gyhJevgRYc2j6kYM1
         45yc7Owt2x9kPQpXSQmf7E2f1z7wxsE3Iz9YyINhgsiOYmP94DgtwSBtIoKTqtkRvs9u
         G3cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791278062; x=1791882862;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hVXnSdCW5cjmKygQI5dCwGO11nmMU6X624qaoCSsgfw=;
        b=t0Vv/+jhAhSsIgd3/C9SSgYSz3XlbqP1jiEq9Tbb0clinKu/cgxBcvYUSLn51+0KQE
         aJ36dPiiYs0nJJ6s2yxI+MB+jg5NsSJCbJ9Pb6lDWhNVXBf8RNNzTosTQSI+MYTuP+Bj
         v4rXKZkxi1+5tIOMwxB+WmEhgx7DOgvgwFO7o80lrl8d2NXeenLmFXYnXRUqUEDNRC0o
         F/l0pqqVvc/LIeHXTW2ZGzbgJgKIKNDz+eXR4ZJARRqh9zqJ0TVJkZ/l335/YGh/Ss70
         j1JMl+T/4O4AMp3SAv0zmekS+pJBDQNAFYllKj9CGHmgkDuANd0YegcSjwuzg/Dt5S+i
         RrIQ==
X-Forwarded-Encrypted: i=1; AKwUvBxUN7erdvr5JQyYnKmvyDA1OSFnIX/xANlag8zKzChw9FGXQpIDfHswyEWqDZIxryLIZDEsO0W+9HTl8e6/@vger.kernel.org
X-Gm-Message-State: AFq9FYIA1YRv35tLhsNCtT3HYj8U0LoLClaxbHCzLxX5MT81ry6CSvBY
	oH7KeCirhnS8OSpTSLFoud7zwlAO2ML1LMi6fyoPGMexJAfbc3ueKIFFR0Fhkv6wNUtZSHocLNO
	XZtyPvQJWwq27Rhm/UsDJ3+UTanLGXpxwRyyTA9OtcuvVAdfMXJoqOOMrx9te3bT6eFVhdEOS6C
	6z
X-Gm-Gg: AYBFou07hw0E3nAFIlZAv8SBTGA5dJGISYSzH+oBWjzsSfJByX4j0wqrmiY0aYXgGCy
	UHxMIVHQWOPEF5gg5tC1cLg88vI1iaEpo+e5XxL4+eEq809BXhwfn0LbC/V6N6CSnlnBTsZ1GuG
	CdrrzjcSb2tgsW8v8Gr1w1thp3Dei5oW/62mKZqoWH8Vi6W7A+4Kkq6si7oTqhjZYcSmVMWQf2U
	vSrOG2aO9Mkh0aVx4NXvuul/fu0oUXYW/a2i/P13PmqrUEPI4KtWNuuyC2x3VmA5fi48zoNEuFp
	GgWkNzIuFLVCRMGrCdwqzkiRhZ/iUkBESAeo9odNZf04sDIKEqPr6Etk4xx26qz+1EkEsdV+Mo0
	rP4JXHU3+fyczOzVgl0xv0ryFHELt9C+Gk329
X-Received: by 2002:a17:90b:4c8b:b0:3a7:a42:c364 with SMTP id 98e67ed59e1d1-3a87379dcb3mr498313a91.51.1791278061690;
        Tue, 06 Oct 2026 02:14:21 -0700 (PDT)
X-Received: by 2002:a17:90b:4c8b:b0:3a7:a42:c364 with SMTP id 98e67ed59e1d1-3a87379dcb3mr498301a91.51.1791278061261;
        Tue, 06 Oct 2026 02:14:21 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a6ee4bc6d7sm10199342a91.3.2026.10.06.02.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 02:14:20 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Subject: [PATCH 0/2] mailbox: Remove redundant mbox_controller_unregister()
 on probe failure
Date: Tue, 06 Oct 2026 14:44:13 +0530
Message-Id: <20261006-b4-mbox_double_unregister_fix-v1-0-9011ca208d36@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOW7xGoC/yXMQQrCMBBA0auUWRtI06aCVxEJTWesI5rITCOF0
 rsbdfn+4m+gJEwKp2YDoTcr51TRHhqYbmOayTBWg7NuaK0dTOzNM+Y1YC7xQaEkoZl1IQlXXk3
 v0Ft/xG5ED/XxEqr59z9f/tYS7zQt3yns+wfDjE2rgQAAAA==
X-Change-ID: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5
To: Manivannan Sadhasivam <mani@kernel.org>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        Huang Yiwei <quic_hyiwei@quicinc.com>,
        Sudeep Holla <sudeep.holla@kernel.org>
Cc: Jassi Brar <jaswinder.singh@linaro.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791278058; l=614;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=TFnhiszZZ5bK4CJmf443JA0CWYcIimJHjJa7vcRhbrc=;
 b=0TF8DvtvoJGd0sh91rb7AfJymT+19l7UvEpcHEvOcomyDswL1BQop60p25Mao6o/bYwSh45sw
 vnSn1I1NV9ZC0EZzUJ4VEECSB69EhB1B7YhP6haya/xTZgek9xWtWRH
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-ORIG-GUID: F4tSkuVrDHXe21pvrTy9_rSbDk3qlwX-
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfX4RR34y1yKKF0
 KAYDQXZ9IE9KQx+kc9ct5O+UA7g1z8yCJlXLcwSYvY10y5PzQIL3eEWAmAz396TopjwHMN5dQXG
 P+hSI6z67Jllzi6jH9HZmLz2u3G4vAU=
X-Authority-Analysis: v=2.4 cv=PNWaavqC c=1 sm=1 tr=0 ts=6ac4bbee cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=WBG49SfUN3VnnY-3IEQA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDAzNiBTYWx0ZWRfX2qXxEGCa6li3
 MubfsvhfByiclHBFoTn6ZRvRbk81prWw9xZnL2ilHey24AaDIFbDzx5mzZqdzdfmD3I2wthGkiq
 INtvDKIcF/MxXqjMb+TCUDZWoWHAU4C9VshiM82r1TbQdEKyU6Ac9zYSBb8hHIJ3ugttkpElz66
 vtwmPu4shjWQsaFZiwiqEWO4QOZOn5etji/gLXlQfXJ19H9YLFEXyv2QcQueTI5HzKzYjNq8HEA
 +/1r8WlqXWNXmBaHqnpm0qbbUysyteJTweGyP9zvU/fjNbncvJwsD6uY/1oLpTg5nWBpthxiYsi
 jpTfuweI0gPephV3VRGv1MnP+kr8KPWND6cwxLw+DG7F/Sn9MP7Arj+BF1ITu323jsAVSJWLtL0
 zzI5vu0IrY0lL5Fu6tgwU6jd5auughS0aKukhrq4Ul0QnvwJ6pRG4KcnJphjA4AqCqJyzf1D/qY
 /Ycv0/m6viFIplG/OpQ==
X-Proofpoint-GUID: F4tSkuVrDHXe21pvrTy9_rSbDk3qlwX-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_02,2026-10-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060036

Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
Anup Vishwakarma (2):
      mailbox: qcom-ipcc: Remove redundant mbox_controller_unregister() on probe failure
      mailbox: arm_mhu_db: Remove redundant mbox_controller_unregister() on probe failure

 drivers/mailbox/arm_mhu_db.c | 8 +++-----
 drivers/mailbox/qcom-ipcc.c  | 2 --
 2 files changed, 3 insertions(+), 7 deletions(-)
---
base-commit: bf1ee2bd5c2da8992f33c8950ef194aaff74ed6c
change-id: 20261006-b4-mbox_double_unregister_fix-42d5057d3ad5

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

