Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9A11380FD7
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784376395; cv=none; b=nYSw3+mbZHGMtns3/uM7fYGXIgX6HYLDW4hPfjYHngy83kyXUQE2jWBHLV93xly62S/tPCsqdx0UYa8MIyu0eU/YHx+NIO6WfyGy+TDFiDbrEDKFVr0seGBIxSkCLHk81zivwVuKRuNDKjievEef2hqVp2zrLvZT86SWleK4IKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784376395; c=relaxed/simple;
	bh=GyovgjeiGtjjazTDrkdaX+O0ZYLVzvhgyqOlUEIx+38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Tt/n9bfqwT7pz6IJH7eXFWjI2M4pURRmML4BcQwBSKDyauojvpMICUNRBMFxzvH8S7cVNCFFgp1FfVA8wXewH3sgCCdyaxTrP5l/o+ulnR9aqpdPRvyARI5egd8p82b2/inzGHJkcwRbXIR8BAb3gzl+lE3U4tp6GHtwi1k+J3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TjS7bEfy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=byGMX/WC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TjS7bEfy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="byGMX/WC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66IAHEI2583704
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Z1d5ASmryfqakOzOUAiKWz8PnldG4VbwkzoNa3wZPJc=; b=TjS7bEfyN5w2Knvv
	RGYSB3xxy4jcr9dQ+AbGcaNkCu3I9hdnnEdwgeOvrEWicM14KZihIHRbcLT3B3BQ
	9yuo4vk+cWpaPdLb7ji+/sNwfLXlPJhr3RQnjz4J+cqfis/tbUmGNvYwC6iol3i5
	bwiFxxfl14Nahvpo6S/SUkEjErmVT0yGwCWvmyRJL257Xm/Ay1zg+RKjoL79gc3x
	0aQNN5XLb7EdhHOqLzw+i+xzBl2W0vw2CZq/QELYK8G+nQrAgaby5lzCgGanfFMA
	/MsTPaHtTqRwBfSUa3RhiBXFQTIl4aGrRipo/IlttY0FspP/vU+4SEgx3THAf66Z
	B98k8Q==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fg2d90p71-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 12:06:30 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cea6a46766so124827605ad.0
        for <linux-arm-msm@vger.kernel.org>; Sat, 18 Jul 2026 05:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784376389; x=1784981189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z1d5ASmryfqakOzOUAiKWz8PnldG4VbwkzoNa3wZPJc=;
        b=byGMX/WCiZmz1sWiOGrs5HlEhjUgWSevddms1D6OB4Lib6QhEr18xDGmcU6qLvA8fi
         PylMkUYxoTYQDGSTekBkN+VQbg+bugFyAtuw91im4NRRgOjGEYnkxLpdzRYE8eSSEd9B
         ClvxiJch6PWtoHkDuknGSlo6G0fHMJNun7DdK/bYIuUhm2yk23btgpE5xsy2oDobEAkN
         9eK9YLyhEpk4dRwIPbn5oERKg43ax2DeSFpJnzwOaMs86X7hCcXkBdjM3sHsIhBnl/6a
         Ylowk+xeI3j1tqJVt5rXNzdApojfcRMWtOF4E/lx58E6mX4I0sgPcVvL3MPqlrpdr/Wh
         mdRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784376389; x=1784981189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z1d5ASmryfqakOzOUAiKWz8PnldG4VbwkzoNa3wZPJc=;
        b=Aei3wHVe5tmJ/fSbmq5ZvLBkGdWGF+WnIt23/2M8J8SWg6ZpWgnnzeJ5Cl1UmVH7A3
         BlPF3pTh/PcYA8KIddKDgmsCl56blCBCPoEeyTyffP/N1jhimAd0DnJJlFwomJGaB/vO
         Ay7sI0lymye8K7CSw6tGjTcD4Bd4NEr/hQTyjnpZ38LHnXfYa+0xy3XFzHXbahqBSsp7
         pQDkjqb4IYEIzH+RaoPnZaQt8HunRzlTzG8bWf28f05bUgqui8UGDU1W+ZEGFyyJvecy
         COivDh4jDio+/jVGZ6HiL0PIxFcFeFGsghdUh0Yn+cIqCKzBi74ICdlIOZgtDhSo/+fK
         EH0g==
X-Forwarded-Encrypted: i=1; AHgh+Rr+YTMRWm8+BWPyNk803mtY/MbKm6Fb9cnoxutQaDPXz55Uv2MP0LGTeRNZsiAAPT3lh+oyasM0gywwz3fj@vger.kernel.org
X-Gm-Message-State: AOJu0Ywhr6Z7V61Gs12Ql6b0RkzbVgjB3v+jCjd1VpPM6eqZ0fa7sD9B
	rc9yy0uKxkimrRumNxr7O+2gX9iVxZyc5y5oysXAgkeLh8AN9zmA7OIrmQqH5QoIBq/nBt3Shzx
	YifVdfwj1nW5rIovZ0BtZVzbdmF9t9lc5u8Hmykc+uADUBL9EUsaly4+TKffKjsScAmx/
X-Gm-Gg: AfdE7cntG31qK44FFOYk4sGIBwhxs2yiNhC1zmHnngFpwcyduHSCAB9goTmDq9tzXsf
	N1fn6xnEqhIKEjCDEKLwBYAJU5hCVolnTppxEA+C/gLlQaYkpJNH4plWd1CuaMbIH2p9WXI5qK7
	8SFet6N0J81/E0gD/Mrk3BCCDCQpknaE88kOPE+wHLiOXDe5uSho/hwl6FQVHdUj4Jf9vfdAJRQ
	wiq5b77QQl0Sn7DJv6SaaTJT+NwJMdYBykLhfHLfBRWnIKNJvGOjOj5skkhuoTKT//IuFEMRIR+
	vzS6C8NmVgRRpg7gohhVRqROTpmu3hejg9yiUEUU2UUoxpq5xHQxmCBdSevRqB5e1Z9x8aBUpmB
	mv6R+MfYkI8wU8pGZcBcnwzmBtLbdHzCZKMOAlyPw1/K8bxTwhinVx8YYbhKJyK3L
X-Received: by 2002:a17:90b:3b44:b0:38d:e12e:83d9 with SMTP id 98e67ed59e1d1-38e4b57dafcmr6525807a91.40.1784376389584;
        Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
X-Received: by 2002:a17:90b:3b44:b0:38d:e12e:83d9 with SMTP id 98e67ed59e1d1-38e4b57dafcmr6525777a91.40.1784376389177;
        Sat, 18 Jul 2026 05:06:29 -0700 (PDT)
Received: from hu-ggarmidi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31429cf22b3sm17666314eec.0.2026.07.18.05.06.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 05:06:28 -0700 (PDT)
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Date: Sat, 18 Jul 2026 05:06:24 -0700
Subject: [PATCH 4/5] firmware: qcom: scm: Allow QSEECOM on Kalambo CRD
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260718-b4-kalambo-crd-v1-4-a1069b5a2757@oss.qualcomm.com>
References: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
In-Reply-To: <20260718-b4-kalambo-crd-v1-0-a1069b5a2757@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Pankaj Patil <pankaj.patil@oss.qualcomm.com>
Cc: Rajendra Nayak <rajendra.nayak@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784376384; l=856;
 i=gopikrishna.garmidi@oss.qualcomm.com; s=20260102;
 h=from:subject:message-id; bh=GyovgjeiGtjjazTDrkdaX+O0ZYLVzvhgyqOlUEIx+38=;
 b=SL20adNnQQ8qI0GzIZhQ5MHG90blwWiwlc9bR9vm5sKNJU4IQ1QDvJ3NNPi6yqdByGcOGn0//
 QAz+EYZdS80As4700DPNafV3NZQV9/n0igh5Tn9BInuYA8fSvpuprxB
X-Developer-Key: i=gopikrishna.garmidi@oss.qualcomm.com; a=ed25519;
 pk=TkSjNEhrfsj90i3wkABTZtAjLNr2cfYsujaTvyOIDsE=
X-Authority-Analysis: v=2.4 cv=HpxG3UTS c=1 sm=1 tr=0 ts=6a5b6c46 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=4tZXNd9svdI9rUIdDJIA:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 05Qp3GJYK2H6o0iNm0KgkIW7uuKbj2Cg
X-Proofpoint-ORIG-GUID: 05Qp3GJYK2H6o0iNm0KgkIW7uuKbj2Cg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX2n+Ee4v03Rhm
 eOjqbZDPX6Z+BYw+9driuZ9ZYCqzLD964jZJChWz/UjYd44e8K5cQjUuDn9xBS6IeVzp/QuJ3nr
 wLzLX19W/t3PSq2jwEnthdaL2slN3xxFt6KNRnaGBO4ixqQRK1tDmQ+FdujBwbG6tHLuTdORbA6
 Td79ZCWbggfWRDICFOQEBsxOpPaKQGdk6loyPGx6X/W2h5BSek1AoWp6u4+mBGRLkvB8CnYtW8v
 +Psl1cyjTvqofPCMZ+b9XYihOPnib7/TAC8sgwK++3pusQ8Sn52JZ6JlPqKPvhGVfWRresqWZxt
 VKTdcleNadvatwyXYz5E2xqRej05/Zge9Q5E6muGr2mX1DkW0HVdyEexc1P8sYAxA6c+GfItNeu
 8xCaSXl3U3ahNcyg7itcQwjURlXTWzjCZ0OX9/5MigiZM1D6L+yoBa+Nl9AdMBZszqc+F/pujLL
 HL55f17NDL0b042Zv/Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE4MDEyMiBTYWx0ZWRfX+VgIcIuDmjxr
 47r63pXthqJM65K/u/GaFeX7VHf/I0CfpIA54toBxkQ1xsxQO/GzCjIsPR+1In6P3JXL0vmpaaL
 rKB9Srz9azxEH3mzdS0iCBKMeYjbBO0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-18_03,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607180122

Add Kalambo CRD board to the QSEECOM allowlist for enabling access to
efivars.

Signed-off-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f35f2ee39130..d1cc6c908daa 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2327,6 +2327,7 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ .compatible = "microsoft,romulus15", },
 	{ .compatible = "qcom,glymur-crd" },
 	{ .compatible = "qcom,hamoa-iot-evk" },
+	{ .compatible = "qcom,kalambo-crd" },
 	{ .compatible = "qcom,mahua-crd" },
 	{ .compatible = "qcom,purwa-iot-evk" },
 	{ .compatible = "qcom,sc8180x-primus" },

-- 
2.34.1

