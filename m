Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F1914499AA
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791796640; cv=none; b=cbGGnhvSZQmKZeZ7+vCD9Vy1XHLtBGMEvLGF7b5tyPoV0Xk/AOgQSC6U/FbHCeI/kpltoHafEZOwOFuEmWGcbMsxdR5Fb53hMIq/wcRhG46TjN+pbQ+cey4StAiYNTUGeXiKj24Y7rR7scqxk+jLc90iCzJ3Ih9K/Oq5o41USvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791796640; c=relaxed/simple;
	bh=t5/mj3Sq7aDs4Mlfmy7kHuVK1DOPLoOZndF1AvJXS5w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=c6Q57ptA5t8/mhJKHXewf1pHl5mDZLD129g8OFCeiwYGYaO0Uu2XQ1VyBnRGb1XalB5B6+LZbwLPEZoYs0XqgMylLD93VxPZShX7nmwQawdqEE/trGqm70f1SRvZ6epWZdhuvvxm/GwwowRJzYjiePBu27WCmA7D87huCb1OmB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JlXAWjGA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=h0Ta39X7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JlXAWjGA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="h0Ta39X7"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69C8KMaN2796577
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=2q54VpFxghh
	/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=; b=JlXAWjGAkIJvbqx0eMAmUG4J0NY
	63xfw71Sy6OSuW/QXWaiiGGOCj4LhZFJzkieqUJcEbLMJqSm5/S4j4RP46uBkOTU
	PCTvzzBEl+8yIteRDD2H9U9p1bTQXaOtk6TT4alI0+HeBco6G6xQ82eCqJ9dLMxQ
	dJN+ILs1NDsgTFKuR/czSc6B5UhVEuAkBW4iUZ/cWZ+JSNloGhUvVxDB7G/xGi0i
	Y03hC5SMA6Oj0iGk3cOOJ5IcAh1WD4e5QAe6vYxCv9gi0voxoypecTSjrLifLCwL
	8sCev85coLImQvKyHBT+mOYpf9q/1Tx3GxkdNC4D9zNDvgeUeNBx+ZXJscQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h8uh3gc87-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 09:17:16 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso4426533eec.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 12 Oct 2026 02:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791796636; x=1792401436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2q54VpFxghh/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=;
        b=h0Ta39X73DbvU/MhzdX/aBkZsNyuv3zO6okv/CfPt2fEFwmwbwQzekItFdwofWh9cM
         4UNIXcS1QG/wo7J61/O3xIuI6DSdVx/YMSc5k/SiN/AVgkXo2ijH2n3OzVkdXojNEgJd
         L648smcGQRogtkCaK/DY96Ja3qSHPE4hgHzbdEmlIErH8KoGC0YWjzWlZaBa5OlaPybf
         L/Os6p3S3ZXdE9EiHabxnLKjTJRBngYCw2cv6hP8mARAFCmMDLrSqyLgsxxPk6o/p/lf
         odz5lTFyx/qERhX8GnJlZMN4NxX3ww9v1u15hEV9ub+0bwSOTsNtPixnAszXjnMPgWzB
         TYYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791796636; x=1792401436;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2q54VpFxghh/r2vqer/NoH9EgB+W1mrhbzT0q1sHPr8=;
        b=k6gMZG2IyLpT0cIYA1A+uj0Tju9CamhWw6wrpDpQDkQVrBYKrURu8Osk00A+srn5Uh
         lWcee4oVvnArOpYaUxCSMjY42rqKYcW1JD8j1ABMXH+sAi6q14ZgBZxVeSTRHNa84WbB
         Bu9gEe/jF8wlECBb/+w75LoiyxmEeU6/Dhp0t+Z9XKOjk37YEPulYyxGFyqYONyQlqvA
         xUO9EBU8ANsbWXG+kzlCas+CNNJtVuMAHkeHzhPwzoVq+fSIA4YTcJQZZIOYrgPY4RfH
         yVxHEFwN6DkiWM08dS3Sw7pSmT5OCHhtHX3jtUIoOfHTMM1QikwIevFOf+3gGtrsrAML
         bW5g==
X-Forwarded-Encrypted: i=1; AKwUvBzz/nkUzrhT+7dlYLOO15gV6VYMGFYmK+vBs/SVrBtAvYIh/vtSQk5qv9NULUHEQOMzPd757ULsVK/HgnNR@vger.kernel.org
X-Gm-Message-State: AFq9FYIX754djER6mp9dAH9Dk04Z4FVOZJwsciUIZ63aQgSlBJSXM11V
	yeUrD4r5NfEXDEbxI+9WvEXbfkE4Xsrx/EAnWmzzD86r+q/gcUbCRYfTDljCNJI8wTcfJNV3SmU
	AEl7N5LeB24+sEI/HCh8MW9FN4YOeqOi9qOfSomv0O4EZH9x+20c67AyrqqxnxnqQaX9h
X-Gm-Gg: AYBFou3SuYduqhdoOCqZKye6TtFv+lY0nlNWjdbh3XrTCfIMYD34YjoAvpEube9Rdgv
	to33CHUoHFleW1bq5eGghfM1eU+GXlXn12DIy9RRsMsWJ8UqJ9Plk7ZPskvViydmYjgUg49ayLW
	y17dsw9hwX+Ety0RD/QgCWZqJu7rgPeDHMo7bgRtPmLJEz1K4M44tvT8KFNasi0A3hWhxi3zDqA
	aDw8Gtv6OPofDnFOhDJm2HwAY5RjRplXP0N/d0AjHPYIrwrBG55+BZTGX0WpNOiSTVouyYeM943
	dZmqb5Dw6lOOsjwL0WaiXGYPn+V0/2vE2WuIuIGiER44zPkf0o7XG8kcsSHp17xn0hwF8ReHv9g
	DFSg3K9swyPFifqmgRq/GnCS3FlfG
X-Received: by 2002:a05:7022:ea8e:b0:148:6b82:31c1 with SMTP id a92af1059eb24-16a6081026emr12085369c88.34.1791796635517;
        Mon, 12 Oct 2026 02:17:15 -0700 (PDT)
X-Received: by 2002:a05:7022:ea8e:b0:148:6b82:31c1 with SMTP id a92af1059eb24-16a6081026emr12085340c88.34.1791796634951;
        Mon, 12 Oct 2026 02:17:14 -0700 (PDT)
Received: from hu-akakum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a442956asm34502575c88.16.2026.10.12.02.17.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 02:17:14 -0700 (PDT)
From: Akash Kumar <akash.kumar@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH v3 2/2] usb: typec: ucsi_ccg: Add cypd6129/cypd6229 OF device IDs
Date: Mon, 12 Oct 2026 14:46:58 +0530
Message-ID: <20261012091658.635441-3-akash.kumar@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
References: <20261012091658.635441-1-akash.kumar@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfXz1vJqg5XBLNY
 VAV9HKtarLbfgziw56qp+lyLk7BboVKZ+c46TFAzzq/nCosu3lO/NMM5ImXYapCJd8v+XahEN+m
 8wagJOjgUOaV/LKitVWeTMEIreDkXHSuLywmS02+EuvOpTURiubO1SG7isrTXmbZOGO78n2AL2J
 fDM5aZat0QZmtQIp4EAdqg4z2KNl0D64Jezz1prnXhy4pYbUxwaQKNxn/ge38Z2fkwPoQAatvgr
 ZdL1BejeqZaT4c0l8l58B67ISEC00Gm0M5ROd77x5zMVnvt7AY1ZlUUqF1sLxk7JtRw7A0YH6TB
 9NWBj8zLlsQ5ghDtZ74B8sXUQMAyjBr/5DvScCmcszv3Mtnfd25uO/0a7FNBPyguee0hmI046AW
 FOVObT3BauJxnO2cuwgCZv1YPbSknbqQPRi3swFEfhQpnS5N+zUUgFZETEhv0PcVhzHCR0GW8vv
 sxZfbRSYR5YVidr20Zw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEyMDAzNiBTYWx0ZWRfX1sTC1ln9Fkj7
 f3XxFGIxTuKAJFCYm9kkGayPmGmh/43YXBW7+9jzeKMDBXhCJmEr8ST9Mp029m5hIAjCBS0aUl8
 luOJtMAzjbtZYDbTPNXVkqYPGOriMTk=
X-Authority-Analysis: v=2.4 cv=QO391QLL c=1 sm=1 tr=0 ts=6acca59c cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=YH4mJkl8FC1W5lWNX3cA:9 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: iF9xADU5IFRfVMOJcOjaGshSMBStMiiS
X-Proofpoint-GUID: iF9xADU5IFRfVMOJcOjaGshSMBStMiiS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-12_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610120036

From: Akash Kumar <akakum@qti.qualcomm.com>

Add compatible strings for the Cypress cypd6129 and cypd6229 dual
Type-C PD controllers to the of_device_id match table, matching the
corresponding dt-bindings update.

Signed-off-by: Akash Kumar <akakum@qti.qualcomm.com>
---
 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 3f12db95c7f4..34fde72fe0a6 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1556,6 +1556,8 @@ static void ucsi_ccg_remove(struct i2c_client *client)
 
 static const struct of_device_id ucsi_ccg_of_match_table[] = {
 		{ .compatible = "cypress,cypd4226", },
+		{ .compatible = "cypress,cypd6129", },
+		{ .compatible = "cypress,cypd6229", },
 		{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, ucsi_ccg_of_match_table);
-- 
2.43.0

