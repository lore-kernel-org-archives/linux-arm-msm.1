Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF63D30B514
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787148844; cv=none; b=LfCxKuMN1x0RTx8VaWbCrB7GYg5c5i7G8CzpbJ6RgXuWASzgCxmpXisQfS8TS4L0NoadDS10CSEgdyk64d0CajXcbTGJxXrHkt3dCLGUy/IsfBgKRoGSEB9Y7X4TRADIt5wMrBK8iah8CCiO1oPFIRBodf1b8kFeno+a+GTwHCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787148844; c=relaxed/simple;
	bh=cawCpk82JI2d5tbLf4HkTs17ndIithcdWBs3om1fBr4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=d637Y2ZZTR+DmQoO+Yq6/x3wTYAmfWHgb3+DKLS7RKqToXTklVRSg6YQPPHlFZ1tL8Wy3SH/82IWe5giEdWUqrC1+MFmwgHA0C1MeScuHeortnPgYrFbyl7Oj0L9uTJ7WSbAgMUQ2/gmo2A6uqICLnyalQph6RTeqoF1cxKuZEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZCCAE9WU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQoGQJXO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZCCAE9WU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQoGQJXO"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67JD0PCG372634
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:14:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=wvOXYj83Lj4
	6TcaFpiPYZEYJL5C51YiHceT37foLNcM=; b=ZCCAE9WUlL5dYbyw86mKJzwvwCg
	JqDIcQeVn+ZBKHwBDxsTRQHBRbS7iSqGASTSgixpNfAX7lMk8QptMrIPIm6I9koH
	laDfpYqj6zsfCLduuS8vUV7RZnWG3DPsh9oGRKt9O6SuphNXoj/CmH3ZdAzaCEGb
	Acr5nLiaq5SzT9kaq6zmoLZkcuyyVGZe5XpaFuooLFoWLknHDZaaKTXzE2giRyLe
	apeaxcKKo52Qqko6Qy8/hlpFd2p95S+9uLkP7CFAAn1M6LKoWqscpGiJX7c+WKZ2
	sCFOqbTGS1aISz2ctLuJkfV1LKhiep4INCuWIVQYgOLL10Jo8g5/L9aDLHA==
Received: from mail-yw1-f198.google.com (mail-yw1-f198.google.com [209.85.128.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4yfkbmxm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 14:14:01 +0000 (GMT)
Received: by mail-yw1-f198.google.com with SMTP id 00721157ae682-84624d0cab0so600007b3.3
        for <linux-arm-msm@vger.kernel.org>; Wed, 19 Aug 2026 07:14:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787148841; x=1787753641; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wvOXYj83Lj46TcaFpiPYZEYJL5C51YiHceT37foLNcM=;
        b=MQoGQJXOCKM0NVUh9cl31BRgngH+IlRcoTPrboD2Le+vYX4Jd5JoGpCH52ZOuScF40
         hWgK2zjHRAIt3T9kjT08XhkA+XJK5QUP9930BBYkAZrzEMMJOS04ZX1U6RaG5PeUK1Lu
         sGoxQBVXWMU3e+cAnzTcVBaCDuDrz6AMvR8UeAjpUHbC4hVpMj/7HV+1gZjNkU2vGiG5
         W4WSsgN3Ln4LJ0epzUl/WLR9Fw5/sz5JQ42F9GFk7kLZRTlv+J1yv49qwnIceHeKDmd7
         E1hst7G/g8JvAAN1rttTXo+xqDSp2oyrhYAPG/dztE3isuPPRNu5f3N7MSJS/h0FdyTb
         YyKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787148841; x=1787753641;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wvOXYj83Lj46TcaFpiPYZEYJL5C51YiHceT37foLNcM=;
        b=Ffakh2p6CO4/x9UdRXYZXxQNlv+5lfqSSMbdoQe1fsN7kNeDMVtm1MoBNbZPHcNWAP
         zfyi0yyNOlbcRhlblxfPgx7EHmCP+BROaO0wLjGKQRuddUsSkF/UgZZgwHQXjTZypBnD
         40LBZDI7gkjMnFAc7OP0arGT5yn/UgwaYhQWx61LYPEzYqlVwSaSqbSYg2dfKMbotBVR
         v/bNon7o4V6O76uQaWF67Eb2GJka54eUT+HC7z7uIIpXFcVYhQ4oH+gOu5/ch+CXrLLk
         +fLFxHyQa6Pcbk5uRklkGJ8PmqTz8NHVsskPo3d9pL4gX5kjAB4nnJmiSpIK4VFy2UJ+
         1xwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpOADGNhATNYhQE6V6ZjksmS2acgVgEJq2tfpcW6IgkK79jSqz+hpGByudA0cJGI7yEx6OYWpS4Wawc0+E0@vger.kernel.org
X-Gm-Message-State: AFuF++mdP4JJp6f836W2bx5LC1OaV9VzqwOkeX5ritWV0RpD8TJbvtLa
	Q/iNyNLCaV1BLnz/J4K/0jO7lBUzeEgkNtY16ob7qYu6XEtnlR+5WZRjI6d0hDVxWIwKm6wFWUj
	HycUyBKLxOqd0kM1MR2M4UBJHBg09LbluOsO77Vpgm+9SCzfJD/YBXGXs+SKRp6K7nKvS
X-Gm-Gg: AR+sD12JnJlYgoeSVkAeMle9N6SfjGEtUnnwOlNr/bGDluivPxyIKH2c32xlPQpAYnE
	6uC18rFK1nk1rxP3xmirhB0lLpPE28unZgJVNdA4c2Sl/EypTzebi43oeyLQsAyS999AvX3/gwE
	Vx4JgpPaqjPRxxa9W5H3bAMPMywec504vSMGfVUarTaqJghLak9isIbpDrJfTIhdw6Nm+InBeLX
	99c37rGqGGHMyQBG/53GiT1k6IyXTGKSeNh4RWhJjcweaLpOb6LDxEKNkOdzuHhtos303kpZUfo
	Lw7xf2vzt43pqBwmdiQwUeTXWQZn3QD9k61+vsZB41VqFfBXnUNBNRl+g1Qn0ZV9y79JqO64JEs
	9lvKlNPa3DO1h7Y5cmnQlYdeRmOPwagXM8McLu5FZTA4pd+Ix/es=
X-Received: by 2002:a05:690c:45c9:b0:81f:45f0:21d7 with SMTP id 00721157ae682-844da3846b1mr19050617b3.0.1787148841167;
        Wed, 19 Aug 2026 07:14:01 -0700 (PDT)
X-Received: by 2002:a05:690c:45c9:b0:81f:45f0:21d7 with SMTP id 00721157ae682-844da3846b1mr19050377b3.0.1787148840727;
        Wed, 19 Aug 2026 07:14:00 -0700 (PDT)
Received: from hu-weiden-sha.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-845184cbe7bsm9254307b3.35.2026.08.19.07.13.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 07:14:00 -0700 (PDT)
From: Wei Deng <wei.deng@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, quic_chezhou@quicinc.com,
        cheng.jiang@oss.qualcomm.com, shuai.zhang@oss.qualcomm.com,
        jinwang.li@oss.qualcomm.com, xiuzhuo.shang@oss.qualcomm.com,
        mengshi.wu@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: qcom: monaco-evk: Describe the PCIe M.2 Key E connector
Date: Wed, 19 Aug 2026 19:43:53 +0530
Message-Id: <20260819141353.96467-1-wei.deng@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
References: <c547f8c1-7a49-4cdf-b1d9-22f00c6035de@oss.qualcomm.com> <20260729023654.3840494-1-wei.deng@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: fS9TRQ_rSEtz6yQmeC-p9GhezhWjr4F2
X-Proofpoint-ORIG-GUID: fS9TRQ_rSEtz6yQmeC-p9GhezhWjr4F2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfX2v2bIe8M28cA
 ror+FAekvIl42CLw0a5fxtiVGl+zYzR+cSYbXA6tpQX9qs1hXhwismRKbUkpzh2jJmB083D6DZU
 1gR7N7sUEyLgUjYBMoi1HAAUgJg1fxx4cFcZO40EBTuAzHY716wTKXIJqiIGWbGBGMQxWsqiO4Y
 0vIcBYNB0jnJO87ofU7E2arExIXjU0j2VORnlAjINdqpBQoRQun09tN2pjkOO8RgQTqgA1UaFlr
 uJajwiTohpc9enAa6DkVu7d8fRWWX9zrpqqtn9t2XWua7G9k3/y3TSxJA+Q48gNDHZduy7lLRGK
 0CTClAq0JYlmPOMucp7LBvMO9PZbt6GD8kKKU2BZQfcVbB59g3EsnzzieDarrVI7e9jPO/joZPx
 p8eOQ5VdZmBprgiTHjO7H68hQfvVcpaajF/jb1w3sYvkkJNTZPGXq/5lcAr6W12mYAgMUQiBCVx
 tM6lnmeI0xYO2d4qpWA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE5MDExMSBTYWx0ZWRfX0EgyHrtuRHkQ
 73BunrBjZKtgz5SksfxPH5YQ4qKXLb9zM4sXsLlTTK4tD8Kep9PUSrOh5JrNS0khBMecwTTnDB2
 h7Geb1DFf0ZAKazhFz2ngJNdbZeAH0s=
X-Authority-Analysis: v=2.4 cv=fvfsol4f c=1 sm=1 tr=0 ts=6a85ba29 cx=c_pps
 a=g1v0Z557R90hA0UpD/5Yag==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=Gqtswv3hQ5fxRrJH0_cA:9 a=MFSWADHSvvjO3QEy5MdX:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_03,2026-08-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608190111

On Wed, 29 Jul 2026 08:06:54 +0530, Wei Deng wrote:
> Fair point. I will move the port/endpoint anchors to monaco.dtsi in v2.

After testing v2 on qcs8300-ride-sx, BT init broke. qcs8300-ride-sx has a
soldered WCN6855 and no M.2 Key E connector, but the pending series [1]
uses of_graph_is_present() to detect whether an M.2 connector is present.
Since of_graph_is_present() only checks for a 'port' child node, the empty
anchors in monaco.dtsi caused hci_qca to incorrectly enter the M.2 pwrseq
path on all monaco boards.

v3 moves the port/endpoint nodes back to monaco-evk.dts. Please review.

[1] https://lore.kernel.org/all/20260720-monza-wireless-v5-1-69ec6743543c@oss.qualcomm.com/

-- 
Best Regards,
Wei Deng
