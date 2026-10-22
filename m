Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792680874;
	b=GWutvW3+COI3WKLJTP3QMZEnrHF6i5Kvf3ooXqyLtwu/M31LI2N7rHm4IaTYHCPB6Nnv
	 Zt0KRmPFUxrKE1nOAEgfGqRFFaOiW1RPlOT29QcPQQO/R5SPpB3eYthRVDHV5q4naHiG4
	 Iqiq2oH8xHg+eACm0hzCIxBPa5oB98woz/5thX5PoGRLS1oXV5AsBu+XeIkzDm+06rPCE
	 DuSRuK7Dd+lc51L2RXSBjyjQHUOzZfdHX68+dVfwQqbe78bCowfQhZu6UwXvWGu+EMaWg
	 sONQo3RDrNVRq+mDverkcWp9xvHdWf+1J+XnTY40f4hBzoPRGxHWkbxD6WbWcq5FAug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792680874;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
	b=UX0lOJJm1anUf1TaohRUPZhSHB5rxWDfOWG1nHs4XAxJx4JlnhwUZKfezTKnY6fYrXmx
	 kOddM3PUFcQJinhDaOntzQRv5jR4GkJDY+RyLb6UUjFL6hNe3VrdqLHyKFdd1Rl4rhHv1
	 cClgMjAaHBkMEyNDc59aAHWpbSD1qwRSRxj/Gx/I9IDJn9bAIcMa3FWFz4HJq95LazYfu
	 ykPY+ibbr6DJqK7oUc4x+fUpFjLhm3txYaEHWYpp1uS4eRY3AKu1IaLgLXCCZUV/27KEz
	 lTyQtV7U9j8jcbbVz6iSRAusnWfb8qoYWRuzIWL9L7iZ3lpGXW3kzJEw9F1RFOXhsbQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="FNu/nGsG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1e6LBUz;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FCC606A320
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 14:54:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A3FCC606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=FNu/nGsG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=U1e6LBUz
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69MEFD083048117
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 14:54:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LeyVFsqCqVWi/yTiZu/t1r
	p7LlLuz+7A3YoONaVMHFI=; b=FNu/nGsGUGijxpOunvpAFg313nntuufV14mIIT
	limhirkmXmrBmRiwMvw88X0yLt8F3mvnvnMn7CGMJIS+DqODnB4qclY7195jk+Nd
	pX2tCdXY9juGiSVl9+xBVskQIpSN3mF0GCoHK3lhc1S/1gwlf10hpmcJXAA7KWjK
	kpcVpTskb1YQ9gzGVFlCRERPzQ69inOCwCpzrjTGZ5HxPF0zxyon0x69U0Wx6UnF
	5FkR0UAgWNCVxTdyeqvuuRl3ItquW0v6dNmHjNsBv5uo0cxj9OyF6ozYDeWf2fBd
	D2mJrINo9nwDH7SaTv+YThP1Jtm57LzImeRMatAIFS/A8aEA==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93bv9wt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 14:54:32 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-36998507c13so378619eec.0
        for <linux-arm-msm@vger.kernel.org>; Thu, 22 Oct 2026 07:54:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792680872; x=1793285672; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
        b=U1e6LBUz0vYNgvi01E3wOd3GQxVmW806KeGOQroELH4ui18WSPYG7mUwlluqia4lgg
         INPszpMI9kYMXordzyfQ17RjY4Ra4UNHynAa2BTfsHt20YqcEpKF3rM5xiE2sVvptCGD
         MGsGH7jrTijmXV1tUVfnDdv2/5w7SfxeWUt70nAro724BdH5BnYkN07XH/4zuJdySpPE
         B9QxHo9qa2clAU0Fm2I96HLOwHDllsSeGVxxus6RJog+GVOcucZedokFYP4M47ewymfW
         AYe9V5l81xg1Pcc42XLWWA59+Ijj/d2v1Wxwu3gYuiehfoqAbqdT2JKKAs459XQLXBwc
         OyRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792680872; x=1793285672;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=LeyVFsqCqVWi/yTiZu/t1rp7LlLuz+7A3YoONaVMHFI=;
        b=VERYhkOX5za1t+3APG9IJUw+indPSHX+S21HNR0A/S1BzcVobBDwGckcfDbbG38sYs
         gEnRaY3CME6/61ozZrxDdcsAFdraaCgWSgd64PiadrmX+zanMRgLQnzvKFafhZ4W2WAU
         cp+KO1NMeIntCLzB3ChyNvgg1lxH+xCRQstdS2buen+mP4s+fe1QX0DGKwpiuq3UKSRD
         CKFz9PWaeuRNnpikoBgaXkyHK3ypFUoDDqCJMurfNYhpnflCDLSmnPxNmSQMCv0DLqY2
         1rexrhLVToHFF+vcR5K8FYbkr61lz/YBXmk8rs6MUjPVKUU5a+uLJ3MKJVuzdWIwktog
         3vHA==
X-Gm-Message-State: AFq9FYJpBTXpB7E2dSpYLRA+d736b3WUf2/lIYgBtlFz4Ib4eEedgszs
	MpfMBlV4oqGbh4DUMWs4ZdJ34Cl2pG97Ed/KKK6ZtY/Q6o3gO0GsYoFcr7Hb4APTGxKyiJ1rp4U
	B6dyF0qcgL60eP4ygotcmHuvdecUYTOkS81s5rcNr8VTO3WAtyNhcaA9PPkorM/tXsK4iCRckfd
	sF
X-Gm-Gg: AYBFou2t4HW1GvDpAeSbDw9E4sRwf9N8mM6l6DluI8+NrDoQCmvasPXrSa58K/bUkZh
	Dy6lzw8RR6GTpWt8x1emiuk83WjGGDpbfY07OObHAvo+7Fh2AKrD5pyjRhvsF1DD0dJGl5BUVAM
	MdN4wNMgqtlM4houY8PL8PmWmKUOZuiMrqcn4acShrKhtfHcsmnXUfCBS0hMkwZrblPZDaCQo+5
	0ewc5v/QCy/Ut9oIANwqpbPlMrxqonSah0F/BSyPEFHBDsbLUS9U0LsHMO5cUUtLC0ishQEGZUV
	GjHs8V6w6BG390MUSFmNQjZkY+Ertqss2Y7pQtKn3vU1F574THHCpdsJTolF4NPIW1CNHXQtPMq
	CkwF+IYQr8idcJM+rUAozdTnQcJG/pMDsn4+C
X-Received: by 2002:a05:7301:8615:b0:359:8492:20ff with SMTP id 5a478bee46e88-3674c43a7a8mr6978997eec.12.1792680871419;
        Thu, 22 Oct 2026 07:54:31 -0700 (PDT)
X-Received: by 2002:a05:7301:8615:b0:359:8492:20ff with SMTP id 5a478bee46e88-3674c43a7a8mr6978969eec.12.1792680870900;
        Thu, 22 Oct 2026 07:54:30 -0700 (PDT)
Received: from hu-anupvish-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-367411bd2a6sm26250257eec.18.2026.10.22.07.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 07:54:30 -0700 (PDT)
From: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 20:24:25 +0530
Subject: [PATCH] remoteproc: qcom: pas: Release DTB firmware after load
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
Message-Id: <20261022-b4-qcom_pas_dtb_fw_release-v1-1-d92d84a05544@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKAj2moC/yXM0QqCMBQG4FeRc91gG1OoV4kY2/G3FqW2oyWI7
 +6qy+/mW0mQE4RO1UoZ7yRp6AvMoSK+hf4Kldpisto2RlurolMvHp5+DOLbKfru4zMeCAJ1rNk
 43biawVSCMaNLyy8/X/6WOd7B03ekbdsBhcScl34AAAA=
X-Change-ID: 20261022-b4-qcom_pas_dtb_fw_release-95c140645cec
To: Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, stable@vger.kernel.org,
        Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792680867; l=1584;
 i=anup.vishwakarma@oss.qualcomm.com; s=20260805; h=from:subject:message-id;
 bh=40dojUEYiTck5avIuh4BZLBGj7u3joSJCzFWspEillw=;
 b=HMYQhkmCsBufTsqpejcDU81i+XJ/9B031qiPCSbjZs8maM+zPlzrmJBFmkfKc+l0CN3jB4U1m
 iGFeS0C3y5/BwCarm9Ozo6DDo2U4cHbU3laE3PXpypjuIp5xiJveJQz
X-Developer-Key: i=anup.vishwakarma@oss.qualcomm.com; a=ed25519;
 pk=Y9ilCu91UQrzHOM14SG2IjnmQ1QSroH5uVeBSWEmEDM=
X-Proofpoint-GUID: WqZYJSpD6QWKFRjRc7BD_K1xDTk_mHXY
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfX6qJ5AfpwrQUj
 h7lrzeNWkHG7z2dQDAVrPTYHq1XS79wUoo2qFHx+nZ8a/6M65UadW4CugRbQzSfNmj8kzvDWOjT
 AzpJykzohmMeMbJFSb8ZqarvWGYGCww=
X-Authority-Analysis: v=2.4 cv=F4fC5ahN c=1 sm=1 tr=0 ts=6ada23a8 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Y1IhKJFcC3I6eYhxwIsA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-ORIG-GUID: WqZYJSpD6QWKFRjRc7BD_K1xDTk_mHXY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDA1OSBTYWx0ZWRfXwt59iWIeuqgN
 iVCSgza5kp1EBRzMA7u1sJ7XqKEowGu9uBUxqXi/And3u9VAcDJX0DHvTBq/XlybClzFzI5DQ65
 m5TwSrqzd8UgAUoOtrHzD5Wun8J9e3gyjiOhtq5/Nm+nUQko5TiEf+f4uPySOWa2JzO1CiPz1Af
 4uNE/qQmLj7YMuTGLomYIJkGXr5kIeggb9Y1VNacQe/QUbg74dgJEZyrFerN8GUIQ4aSQyxBhAm
 dS/1rlAax0K/Q3ORBhQeKpHtpKf0V1xuA/vh77RwXxJxWKiH9JwvGLq4NWGzGycQvo33au4EoKi
 TT0NPVbhPlCf1tgwXVxXq0+hCL4eclomXpXYo0CaVNs3fHoU5QUfuaV8/3RMMjw1ayPxDnIwqtM
 diCUhxIGlNx6Wd6Dcr6nZ7OuHx09PqqarEUCFX1oUxdVNtEWTMBUPyWusLNtV5rE3vOOP2w6KRo
 Kwu8p4kKXbDrO+dRXSA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220059

qcom_pas_load() releases the DTB firmware only when
qcom_mdt_pas_load() fails. On success the firmware is never released,
so the DTB image stays allocated, and each later load leaks another
struct firmware and an extra reference to the shared firmware buffer.

The firmware is not needed once qcom_mdt_pas_load() returns, since the
metadata and segments have already been copied. Release it right after
the call, on both paths, and clear the pointer.

Fixes: 29814986b82e ("remoteproc: qcom_q6v5_pas: add support for dtb co-firmware loading")
Cc: stable@vger.kernel.org
Signed-off-by: Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>
---
 drivers/remoteproc/qcom_q6v5_pas.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index 2e1e39826ffa..2ac21c502d35 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -279,9 +279,10 @@ static int qcom_pas_load(struct rproc *rproc, const struct firmware *fw)
 
 		ret = qcom_mdt_pas_load(pas->dtb_pas_ctx, pas->dtb_firmware,
 					pas->dtb_firmware_name, &pas->dtb_mem_reloc);
+		release_firmware(pas->dtb_firmware);
+		pas->dtb_firmware = NULL;
 		if (ret) {
 			qcom_pas_metadata_release(pas->dtb_pas_ctx);
-			release_firmware(pas->dtb_firmware);
 			return ret;
 		}
 	}

---
base-commit: 9a482184d910775cf648863148944945b74e2815
change-id: 20261022-b4-qcom_pas_dtb_fw_release-95c140645cec

Best regards,
--  
Anup Vishwakarma <anup.vishwakarma@oss.qualcomm.com>

