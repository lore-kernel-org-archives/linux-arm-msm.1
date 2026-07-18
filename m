Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FE79388E4F
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784379454; cv=none; b=dbUktzMJfrm6PD2WDBgR6TRQ5qlcbHzZfDKTf58gs3eWakOQxoRxDNdg2UY9jJB4IwKi7660URGIscSTQ9byr13UJK17I3UgpElPZ4gYfBcz1whwGGoFB5w+Ldl29RlVdg751ASp4EXY4NTnUFtrWQNlE/FCO50nPtG0hhc+51Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784379454; c=relaxed/simple;
	bh=+XxCxyuet7T3qjrE5preDyooRigNRSPFJmQPD6VhA2E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=p2mlF7U0mttV/N+uwPtVzR8d1u8wq0k52s6LIruglQGgLdsvJtJHh01nugdex7CLNW8bCAxnvxVi5FmNiyzLH/OkV75Esw/j+0Vt20P77+/q+0EU0E6rTy6VjzHuasU/0hE7gZBFoldjfvDM7e3ZbJV0TDnsQ6HUgy3Ry6ktOiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KVDvJyBE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ij1TBII7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KVDvJyBE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ij1TBII7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHWk3584307
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=; b=KVDvJyBEHp6OphM4
	cMnVHmrfW39oLgDJ29V9qyhUwFuveLPARJrAYQeCOCAhROqF9Dm8VaXzlg7ZhnIq
	3kylAvfLKOd9RSnJZBIbAjHeqHAcmOaHhek0fkQUpZVNPjmQLKT5ZkZ4HXkwuOnH
	aA5EOrZ23vjKGkhJr+WDpGutVK2EP3VrfmAV8Sgb0NHkpM6E7hk9UyXkcsBl0qHF
	aLvabE0hUeCvVktK1Gg2qr0Qff7z+n4xP7qfRNAhHxhcEm5FqFYuY3XANEwyUYQR
	aL4VervTMEDN7Ad9eWPAp0NMSzZZcY/lHt+yv9erka7x06p+Wm7ETqxm61CYhi1M
	pLGPoQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d90rnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:57:32 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso13939324a91.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:57:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784379452; x=1784984252; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=;
        b=ij1TBII7CKWd+Ll8YrZMJvJgfXqEbIbjCFgumlfBsTeKyyDcTRVDwMIGxSFJaxj17y
         8TBHEAIKJbky+C3Z5qekVChchMyaL5qAGYyZijQ+H95Sws8v7hFAPhq4NmSzbIeiZXzd
         eG0eqeMWa2QwnCNwXi05SakdFejnvZ5eAq1kYx9G/h71gxy39Rz359iQwz43ikJmXEIR
         R6kMRRvFbvExCjlTGVUfv/kk5FoSrjG3gDXMHOuBjU5o4fFOa8e6jJ+vQascgtsO2ZD2
         /DqsrN1TMrh/rxYPduKF6lKDN/isA3XzAVoQagb7NJKK+xaB4BboIvgvORuOgNFkp+U/
         qx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784379452; x=1784984252;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=voohPrGDmmhyk0EbFdOyXWY2pG21Ic6EXwxY13r+PaY=;
        b=iwxyiCHI7XAFtzViZKddOOg+/034PnhtorQaDYGvflfJTLy22S43uABdOpLmUjJRhM
         XsjPWOtV4PliU5ill/SFJrbe4Wa4p7STdzeFWdmMQPRZEDq/Y+7CnAxA8EArDp1rLAb5
         yy2BtHCMPtW4vo1W8F0uEbufLklqWe1GfGQ38F/fsy4Np/1W6aMBl848zLQmXsqI091n
         HLlhazPM9tDXs5E9xP+sf/M1QUKRZEJJiJT7wMRRlSOCbjkvWPs3PdCLSfg/x6V4RfGI
         aQ3UhZRpeGG3nA57Fny84QGHK52iQ6nNZFWDA5K7fSt5cixc7FdP9vWKyKIMPMKwXY8h
         FNOQ==
X-Forwarded-Encrypted: i=1; AHgh+RoVWgvow9cnMngtsQLNLeJaLD44K7TJGonyNfG/FbFNaIgn8bwbl9Mtux6g/6K1vAWd4u0a9IzSiehO+G0y@vger.kernel.org
X-Gm-Message-State: AOJu0YxhS/dpEwn/BvVTjtCHw1VdKJ4gmxHLUJYNfRG7/+jkZHOkiB3P
	sPQZs3y0MzC650f6QbTD9AuEJ+A9NB3U8r5RLCI4ZiLJHllonLU4fM8vyg6n4UBwOwOSwWKh9cc
	+k7Efie+kPvuUb9N0j9XQ/Uzw/t2i79IaMdRd/W4SI0izkWN1evVMJeuJqMzC45C0K0YV
X-Gm-Gg: AfdE7ckdWASPCRdBPH59cirsTGqp+8KqY3SI5vbT68zdqgbyCYxEp5xT2R7Xjjp4Duh
	i7LecY4JcKLh5C0Jtdg7fQ7hil2ROpOt4EQADXsCYIIvMjFRto1Zt+2ua1zdqlA7TmK+lXY6+uG
	QCYfLCEmxgC0MPOQlF5ijURQdzrAwyOZtdiLQjLAtRAxU1PL5XfZawM3eWVVRbVDq5RFNc1jaen
	IwzTJlPXQOXtVh5avdOqPdgvAMdwYbMyfDcw0TmEWoVf/nfEgOZTYqN0HTnsraRVcYLfgh6rNz/
	hqEqrvQeQbOqvuylodTMOT6Ts3lwT021SVDpTXzPGBRFb4+xoKGkCFf9qMwzYVV7hA/g1CZnsFY
	/gfdecVqeXbLzi8eEbm+Vqqacd9GylXM=
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr7280471a91.23.1784379452078;
        Sat, 18 Jul 2026 05:57:32 -0700 (PDT)
X-Received: by 2002:a17:90b:41:b0:368:af5c:5925 with SMTP id 98e67ed59e1d1-38e4b54614cmr7280449a91.23.1784379451690;
        Sat, 18 Jul 2026 05:57:31 -0700 (PDT)
Received: from hu-imrashai-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm14238910c88.8.2026.07.18.05.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:57:31 -0700 (PDT)
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 18:26:18 +0530
Subject: [PATCH v6 11/16] clk: qcom: gpucc-qcm2290: Park RCG's clk source
 at XO during disable
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-shikra-dispcc-gpucc-v6-11-62703e05ef0f@oss.qualcomm.com>
References: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
In-Reply-To: <20260718-shikra-dispcc-gpucc-v6-0-62703e05ef0f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Brian Masney <bmasney@redhat.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5b783c cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=vsOEvA3BJYGQS88P8KEA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: 9fNLvOF4GMKlqCE6uO9801-W_F-qO1To
X-Proofpoint-ORIG-GUID: 9fNLvOF4GMKlqCE6uO9801-W_F-qO1To
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfX9AFIdrFslwRW
 qCzAbndOkaCK5KwbiBwQnfpbStxEremiDaHmDajJNXsj5Sn8Bb0P9k69uc2dvKUb5lqjYzWyUym
 Uo5vaMNePVGB97g6m6USpJ3sW30OvX/aQLiaidVyQUKO3SaQZRcSECtEBxSKRri8QWwrQIrhIJ/
 OKI/g5VyQgRj6IOdo5V+WZrBnsU2rV6VQNVUplgUGwA0UVAxqiNnaHlBzZBIhhaKvL+4xygKe9n
 /epuds8a/Uz3fL8NR0s6jIjfW1DUuYVh6bg0AyHFouzrnjh26IacxcRSpX5uPtJ8wel4r5XEgNQ
 WjzeDOdTI3cnhkK16/wbAWDoQB1umwd8siGjaT7JOT/wn9DsqsdNVI0n8KgxTqFbmdJ4EurQd/P
 +Gsk2ntWIfRQERDVVS06R70csaJC37lVtrFdfQk/NrJVTbqRK766M0+e1nqRjsGNBFAKadRcOpk
 03HnmdQMrn9PTOt4fLA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEzMyBTYWx0ZWRfXwyaJBnFFGgPS
 geFfcJTh2Ka6SJh4C7EQT/kXVO1YxF+pWFUOzkqZ3Ler0faRXN3eSkOQvG3XQhdm99oW99MlGWc
 iviXZqzBnFjlTKTQvB1RAYnhZYNj5Kk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180133

The RCG's clk src has to be parked at XO while disabling as per hardware
team's recommendation, hence use clk_rcg2_shared_ops to achieve the same.

Fixes: 8cab033628b1 ("clk: qcom: Add QCM2290 GPU clock controller driver")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Imran Shaik <imran.shaik@oss.qualcomm.com>
---
 drivers/clk/qcom/gpucc-qcm2290.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/qcom/gpucc-qcm2290.c b/drivers/clk/qcom/gpucc-qcm2290.c
index 78797b77d7c7ba053201064ace3963cf2bd5281f..fc33d82bcfb6843307d002d67674253f0174cb4a 100644
--- a/drivers/clk/qcom/gpucc-qcm2290.c
+++ b/drivers/clk/qcom/gpucc-qcm2290.c
@@ -144,7 +144,7 @@ static struct clk_rcg2 gpu_cc_gx_gfx3d_clk_src = {
 		.parent_data = gpu_cc_parent_data_1,
 		.num_parents = ARRAY_SIZE(gpu_cc_parent_data_1),
 		.flags = CLK_SET_RATE_PARENT,
-		.ops = &clk_rcg2_ops,
+		.ops = &clk_rcg2_shared_ops,
 	},
 };
 

-- 
2.34.1

