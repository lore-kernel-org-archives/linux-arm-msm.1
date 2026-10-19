Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2640546267
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792419182; cv=none; b=eByUDjvaty7mItsRUsu/P9qMwE0LaPXDc25SQkip44/mp9KtGndeuIJRoN7blKPkw8EkEjjKnYXqVCS0+4a+kkqCF6DzR3XTevhWMigtoEQoMLXYMaThs/uUGM8OULsUqO66LCuIofGaO5CWz2FtBArF/QCbTPCRwXFRJ8Dhs58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792419182; c=relaxed/simple;
	bh=4evihIn0bxYc63GN9wtAllcv7hZd50BO23q7/zc5e48=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Z+cNoBlrgv4xI5c9f19fsb84BxrVrCG1DPiO3kC+Zx8ulRHtI20dTfJxaKWCIUqdsoovAlw8FktLFEz2T1guPJV0aWMuE7/sVQmNc597YUb/41qo/Ggp2xjBgulxWw2pj/aojW/d2srIZGvgQkOHYB1g2yefVeK0utbdr1/7kUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VU83J1dg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ur5lCiOc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VU83J1dg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ur5lCiOc"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JE0Vsx2401764
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=; b=VU83J1dgHrtZ5lK7
	NUT+WvVVFlySonV6oqM2NCK61qBB7XJGgFaLfwjpp8eo+Wvne4Lh1yroXBMTotVg
	QL8OPH/BM5o4+jf4qPpEv8ZUdlj13ZmS3Zk3GMKYUG+kUA1uS7+ksyo//aACxi3+
	ctsa5CQJTk+SuIOFNdORTX/rSTIFieAL+CkEtp6fIMnztjgXlK11uWLgxYR3qgF5
	efItTDI5yrYbh8+9i8adyk4h7lfA4H8AugRI39ymz1xDGSZJXE9v2RfhyWvY8RDk
	5nj0ZO9NzfROT/rEP6dR1kXbpT8umGvnwzudOyxzyJSdDN18h0rpn7cjVU52YLma
	BshKjg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf3n1jfc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 14:13:00 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93a1de6d5c3so525542985a.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 19 Oct 2026 07:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792419179; x=1793023979; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=;
        b=Ur5lCiOc3ATy9dPGIrY5boTXr13h1+rFsPUP1A9+T6BuMDxKgGtXywp/zKSmsCmEuW
         Bw9S9ZJaB+3L4kWUNd7pT7xqUVqmxd0gZqcvlP8GiowSUemd/GNCDnKN1u4rFvYX/cpi
         aOFdRxbYiErKxuQGexC7g+0e6xWXpYSf3niT2rcx8wsNZaFEv5KArA4kUC5tZwOZ40eP
         Xw22SAAFg1fOx8mt+2wlYWej3ZkeZwUxy3mI4F68w4xNRxph8ccM94MmXN4h0hHDfBpK
         aK/pSy5Tdse1XPWolln7DIxeNqwcf5DRA6Ha7MHop03Cdppk0+RUwORPzDistyX6DWln
         DGrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792419179; x=1793023979;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Py9TTClt1j/q/B9ZyzNORZhfawN+TfEcfI3tLiHzs2w=;
        b=bLupTSLTp7fMTlsaDWtJJdYVh82ZgoFX9D3JqNbxwTif6nqc5BEZnbyPeXipylRbdS
         mlpazwNhytWzvPxtgzHiQ4/7Qy23oCVNkX4Nh+I1nkMZYSEkJndxE56D+zbkZlsLETmZ
         IuY3tCTcF7z5twQdv8PD61e02gGWS8/VGAwVW7ExsreAfNmRI675ddhH9YUGmGpTu7Qh
         +wh571Qf43+ulKq5de8os/a9JnbWjzWE4hlZBA2rFnEG3Ru7yA+LRQ99uC4Lu4zNkfHS
         5UH7tbcMvEuD/Lh3D6g7rh6pdFFn4m8h6yi2YzeRNiiw36wvyAWgX86zWvoMKP0xVIm2
         KgUw==
X-Gm-Message-State: AFq9FYKTkk9s4L/05NEZftneu+sGh1JRHxMQd6fsD0aT9XCE9ITGtLH+
	P1vmb9NBxJSaOZ7Ujqtxd7lDlTGJO3bTMEMnJg5xfyfIQB3wbvHXsSxs2chN29JsnDV2N4uEz7j
	Za6wdtB3yR6tk3nlsDTP5+QBg3kVsTXVOpRD41KrRfq5GZ/nXV5IPcYdT8m0tEUmw/7e+
X-Gm-Gg: AYBFou3epjZ+HboX0RHp6XaFRwYzTjE19DU54ku1XjxRGVN38qfngVHubSaDsqL+sHr
	hOWfcglL9tTdwBPP1hHKlc3s7yabBAzO6IOswQVBNpnncP7CIdLgPqhhzVPVnrC7RvfTMJ7CC7V
	fWUtIFUcmYVKv98ixY01ORCjyaQFo6ndfo5wP+RCx6yooszfq9Z0bKZbZgKlPpTzOsOen7F6smC
	KyiCciqiWKG6zQEf/SmJMrRgOkhGD10vAqo8YopWddY+qDfzCq1/9x2rLdY1q9FXrIQsWff1dW7
	2UWcAaIJK5kd+74aNUwd5LKfVdWRf8wkcNKFndTaMYmojTT9YyKk+YkW5MVPRy96r/UoRkKrsHn
	RjOWNXeJ+BnvSOZHrH970JhGbv3ReH/Oz79tSQvZRE4iv2jQ7xi0I/jpD+BNNDCGUdG56trZH7B
	dcHJVsQk3Z3nT7
X-Received: by 2002:a05:620a:40d2:b0:93c:720c:94e0 with SMTP id af79cd13be357-93f29d36396mr1213844585a.30.1792419179151;
        Mon, 19 Oct 2026 07:12:59 -0700 (PDT)
X-Received: by 2002:a05:620a:40d2:b0:93c:720c:94e0 with SMTP id af79cd13be357-93f29d36396mr1213839785a.30.1792419178603;
        Mon, 19 Oct 2026 07:12:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a42ade9sm2015922e87.14.2026.10.19.07.12.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 07:12:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 17:12:40 +0300
Subject: [PATCH 2/8] soc: qcom: smd-rpm: Handle zero-length errors
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261019-msm8998-icc-v1-2-c2da3934b6c8@oss.qualcomm.com>
References: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
In-Reply-To: <20261019-msm8998-icc-v1-0-c2da3934b6c8@oss.qualcomm.com>
To: Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Del Regno <angelogioacchino.delregno@somainline.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Andy Gross <agross@codeaurora.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Shawn Guo <shawn.guo@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1088;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=FlXx0Df31B57IuZnrZTPHJb3Vqd4TKJsFeozt5W+WzM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBq1iVfEts7JDn9h1Zeppli16gelEutWsW1DQk0v
 j3ZDi9UG+mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCatYlXwAKCRCLPIo+Aiko
 1RppCACQqFAKdIN4mv7EkhRGPMsQzpnv8AESfhKraF7PSwebpe9pFTPEMXFr3rSc7EibVfDq/6h
 njJ1SJbVgwIXbWCI2aCBv+3/GiBLgwm7kdV5ZDuUQ7/ktbaX3NvpnOLj7yYrXgzOwRLW0LlU3Cl
 1zGsJ40L8qc8iUUdC8UfE+LRfNvyS9pOyXJ/jMIE7pMl0J666Ulu8pr81/yoAyyKwBgfYZJjpdq
 /U2T9epu98qDN3mb2wT0g2Kn31eDKYxjEU1rqvTUEp4exQWl4qlMaeHwgCzvKCl2isKBcCXRVOQ
 RjEy5PNFMeOQhLjjf71gISMRwAizsOgUw46OF6aG6PjtUwzr
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX7aiY0N6PzD/M
 vGy5Aj95Dwh0J2cQ7D5gWbj1DgfYvsrF2bxwqgwCag0fd+OYFA3ygRwXA/ciltDxvSvBDHMXsmP
 CgoQDSSIb+NyRPLnTn46k7E6EpgRHmg=
X-Proofpoint-ORIG-GUID: ecfe1GExu9w8p38GayOZ73yRLQ_NSyiM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA1NiBTYWx0ZWRfX96uUXlk69xxs
 GOYwEXnE2H4CH5tJ7M7KTm4b+ujZOs1AL4hjMvljQhZEXsXTK3y7//JQXapZ2tnWNOmK7hJ1pQ7
 KiIZgayvihZAhpiIBMXI43rKgqjEY7edhP1H7ItEN89hc0DJr0WdGCw8TFqIjouQ/ak+iTgCXFE
 18msZRwq2awz5MpjHSkbvZCcBh4C9+3rAXD6JUMfPu4OgURfSoc+us9XMwPthT8jsf5/zcVEqkW
 MzNI7CqG9+hflaDbBT1/kuWiC/aitSixsMLsAqoIEUROOpBXMFDKLdp/HVLSQeeZJppjzrni0jb
 H0OdVbg9hR/Fb4wyuBoiQef2CR7G4E6y42OKN1C1QcuNW6dGC+fIY9HQlp18po8gZkU5lyu+6/1
 8IOon+F0UgU4/0vtBLA6XAeQea9yu0QTGazlmFIXavGiBhli39Q76eCc4gHm7sEENktVHlEu33/
 jwTbxXa5KibKOQhWLLg==
X-Proofpoint-GUID: ecfe1GExu9w8p38GayOZ73yRLQ_NSyiM
X-Authority-Analysis: v=2.4 cv=Zf2IpcVA c=1 sm=1 tr=0 ts=6ad6256c cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=CuedHqBScD5EtFMGVU8A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_04,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 phishscore=0 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190056

From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Prevent a potential underflow as the code below uses 'ALIGN(n, 4) - 1'
as an index into an array. For n=0, that ends up as '-1U'.

Fixes: 936f14cf4e67 ("soc: qcom: Driver for the Qualcomm RPM over SMD")
Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
[db: report the empty error as -EINVAL instead of a success]
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/soc/qcom/smd-rpm.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/soc/qcom/smd-rpm.c b/drivers/soc/qcom/smd-rpm.c
index f2b3e02abdf1..3677c645edfa 100644
--- a/drivers/soc/qcom/smd-rpm.c
+++ b/drivers/soc/qcom/smd-rpm.c
@@ -173,6 +173,12 @@ static int qcom_smd_rpm_callback(struct rpmsg_device *rpdev,
 		case RPM_MSG_TYPE_MSG_ID:
 			break;
 		case RPM_MSG_TYPE_ERR:
+			if (!msg_length) {
+				dev_err(&rpdev->dev, "Got unknown RPM error\n");
+				status = -EINVAL;
+				break;
+			}
+
 			len = min_t(u32, ALIGN(msg_length, 4), sizeof(msgbuf));
 			memcpy_fromio(msgbuf, msg->message, len);
 			msgbuf[len - 1] = 0;

-- 
2.47.3

