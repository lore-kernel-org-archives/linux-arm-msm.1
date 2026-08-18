Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44A9F45DF5D
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787056633; cv=none; b=Q2lOt+K5uua6T8JmLktjZVNELOy3nhLwSm2XJoIgPmavGTKz0Jyiiege6VXimEsoKRZohkWt+J7KQeE1hisaQRd0IGEVeay9csE5ymQI3iByLx4jZzmkF0rPRnZGJN17s10lLErK+U8Nk2jTChMi6yDHy7w4ssn6aSi2b02fyyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787056633; c=relaxed/simple;
	bh=ia3tKnf/p1+sAGYx3IMxdiSNORKJQRIDq3/MVHaRTsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RznNr5NJA1rRNIh59tZoU3kr12MeXEN30k/03lfRpe8a1485C5oFTb0h5HneVPzDESBzlT3BhqUqOIJAr+mh/fG+urmBYfXhZk3WyYHnJn1IpJFtFTXwwjkBFEgJ0ow8ZHnKkPlePtt+0CF0p51wWpS+Lhhjo8Og+tiGEa8jLCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mjAIndzp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dh2m76ur; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mjAIndzp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dh2m76ur"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IABgOF820164
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:37:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xuI6sB3b6Zjm8p0n5YYO+VbCGiewnxqKueBLJ9fg8pY=; b=mjAIndzpNSKPSGP3
	fHq8PrY6G2bd4P+vgAyKlYYA78ugGJ88Aogs98hploFWBlgV+9fLkl7BZczKe9am
	j3/B+vZ6mmm1N+Abau+6R2/8vFfaHRmPfywF5GNlov4Aw3O9HxZUQYkUPl4eTAOh
	7nvpWuci1yYPPD3u4624F4D6PRQ2RLl+clUmc/TodTrejq5gwfrOApHKAXWbAIyo
	KPP5/4x+zm4zvN0R3uHTLlfXCmWnSo9oDKB37Nq0YqO8oS3qBAMHfsTjRzVNE0Ra
	cH/eZSauUvRWbhlnBBhnH7pevMk+JERatiuwv15nwXCqRcN4skvbIjTpucjk4iMG
	+/D4ug==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4g2p20wv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 12:37:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9310484c005so5541585a.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 18 Aug 2026 05:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787056619; x=1787661419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xuI6sB3b6Zjm8p0n5YYO+VbCGiewnxqKueBLJ9fg8pY=;
        b=Dh2m76urSt8lTn8W7Dctyt2XvPnW3b3dS3mv5hoMvbqd56NVu1ydOwX8Bd9GxG96i6
         WPJ8ixIMau71qQYVzFO5+s4HzA7ctnPUG2p50pjsTHqSPp5wsutjAUEupK/liSiwnA9i
         R8flO0VDJ3NxtRNXJ4vaP3BlRqA/FP7NCVPoU+g6oUDkwRpnP5OF8/ZwBHDunE573fot
         SUvxxY/pbR5nwz2UhHD315m0GAS8Kn3jauHtnncvUyRuZnJl1SPhQ1Ev8364wy+6mity
         BqiCG9ZkjUvi43rf8Gz3nCiOoIQoEDYw6TXuECmwGXmpvruY/g3yrlPDmKgjhC8FclFO
         kATg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787056619; x=1787661419;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xuI6sB3b6Zjm8p0n5YYO+VbCGiewnxqKueBLJ9fg8pY=;
        b=qA15p0qK38yOEJHKmxqfuZtOY7eTkcwwDWaZ5tsWM5LR2PtVEWNnPoMG8MV36bWmad
         r/fXGLRUnyR61C8SGgJusVn+f5Hig+dAQmAT+sgHm5wpCx+ZDC78cOxMKBsZHPHxcLRq
         SgjbhrtYtcs+JYDOy7HvYProI58+YtnqPwx7pZ/oedp+Uq9xbAeZ2SNV5w4t0wLB9Yo8
         AphHuJEZ8T/bPTyWaV03fXlFqHXtr1e9NIS0g8NyhRMLtGCX4tRDcTLX1+L9sgsiNOZ0
         iY93WbPBtGjRctoYzTBwmTblB/g2DkD/YE5+azLTFeHtSfLojmAHiDelMM8AYaDcHT8a
         J5TQ==
X-Forwarded-Encrypted: i=1; AHgh+RrgcPW3foW+NSwAZ2QG7+FfSqD8AJN/8+EHiEM/fF2xPyP/IodbPljYGCMwawCwjEUNibkciFXor7rDvpjh@vger.kernel.org
X-Gm-Message-State: AOJu0YzVeM6D2xqmLiJZIMTLKDV63bsczQTYge7cqD7i+SWc1RcMvGyE
	dRg3xuV68jaQASqawzPlinDeepBVgWOHw5psy2UM15bOC+C3m01GHd78ua6zMgg4T0MV4EL3ocf
	ahK8LJhv5iejb7ey3yX+IF1ZwIIgUBOyteALY1Q+N+FnoTRKOCjFHVnoQ89pfQoZ4pz7xz6DSmI
	qw
X-Gm-Gg: AR+sD101o5r1DX3dm8WcCtXbS9VVnpXigUGX2Xo6iPWj4IxAh2ZK1I8owQaPTXw2Dvs
	hboK5e1HL4+8G1zpZhfZvA4bsvshNokKsI4PtT/1xDxU7LE/f6sR8ejX/1Jb5YgBrepJTC9mNN7
	hM6JyMknkWQHrJFxwX8P6KW6p4KX4G5L83YTk432QjON0BfGgumr1P2QJNlRPUOp5t4FpuK4f8d
	wrjx6DnWnoFJ1JNVlFa6T0UDBjByyxI1pfaH5khQJaAK7SjWJmk4XWc3gn/vSwfD9ueO1lO+cBi
	G4+rqNmXb5Ze1SEFaAro+ptP+qmSZlKmPMtnFLwNukjEqshgFQGV0VJ7WJJN8Arb57krVK5IAuG
	uM8b9kDXSTj32xya7yYvePup4
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2609346285a.4.1787056618312;
        Tue, 18 Aug 2026 05:36:58 -0700 (PDT)
X-Received: by 2002:a05:620a:600f:b0:931:23a:83ca with SMTP id af79cd13be357-936d23849admr2609339685a.4.1787056617865;
        Tue, 18 Aug 2026 05:36:57 -0700 (PDT)
Received: from [192.168.120.193] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3d8588655sm1733817a12.18.2026.08.18.05.36.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Aug 2026 05:36:56 -0700 (PDT)
Message-ID: <40868661-4a52-44bf-8ff2-790c222c10bc@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 14:36:54 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] arm64: dts: qcom: clean up PCI function nodes
To: Alex Elder <elder@riscstar.com>, andersson@kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org
Cc: krishna.chundru@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        mani@kernel.org, sushrut.trivedi@oss.qualcomm.com,
        umang.chheda@oss.qualcomm.com, rosh@debian.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20260807195846.456079-1-elder@riscstar.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260807195846.456079-1-elder@riscstar.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G-bAruu8XqBMgYzmVDNmqPxT5kvy1gU3
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX+t/IRG0m94yw
 rKpZXDR7HoyZw6QFn0XCggVb1e/+tHeesvQ39nmg5D5PGZ2Ah7d7yca4lP9Iti4w0SoXy1L0MdX
 9AFEfYvwIQN+K0gqCl88S3j1FaPzlMY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDA5MyBTYWx0ZWRfX4e/zsLOxsntB
 vncNnVidYbRHtYsJ+406RLiVDSW+5h/8rRRkB4K13XLA+5/mhO3Th/hcLO84iIg4+TortNoWwoZ
 BI13jOXkwG/yJUcJE1Tab4czMYzj8SVI1hmDQSA6mE1zZOMGgajb7yzDvlfGJySrRzWTlbfS8Wt
 zY/0ovxXiK9GxwPuwcRZYE2ECkqh68JU+S5RQsAn/d3Fm9Z4Pp6uijGj3MAqs5ubtMisYiOy5oE
 Iv+ZDtE+zES87bmsXXSWYA8Y/WJp6c0aFWoMFDpMxcUkqCkKg6ByR22a0Nx6xBdUK7wwT4e71oF
 34f5waX1AeqNXwlUkmjDCKXrdQDMkMuxBJR1zEUHMLDj44913RDFbxnA3v7UUWsGILr31z1ILpW
 doe92gbMU1744D/LQmpl68hB+hJjpxptEzcG5NF3cPcQSvS9kzstJ7hQPeLuXWS5xIYpSnkJrSQ
 tLnzpMffia5V85sgh3g==
X-Proofpoint-ORIG-GUID: G-bAruu8XqBMgYzmVDNmqPxT5kvy1gU3
X-Authority-Analysis: v=2.4 cv=bfRbluPB c=1 sm=1 tr=0 ts=6a8451ef cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=-CsPNILjdqOFwjpKq40A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_01,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608180093

On 8/7/26 9:58 PM, Alex Elder wrote:
> While working on upstream support for the Toshiba TC9564 SoC I
> learned that its PCIe endpoint function nodes included the
> device_type property, indicating each is a "pci" device.  Herve
> Codina pointed out that this is not correct; only a PCI device
> "that implements a PCI bus" should define that property.
> 
> I looked at other upstream devicetree files and I found four other
> places with this same mistake.  (All are for Qualcomm platforms,
> and all are for platforms using a TC956x SoC.)
> 
> This series removes the device_type property where it is defined
> for a PCI endpoint function.
> 
> It also removes the #address-cells, #size-cells, and ranges
> properties in these cases, with a plan to restore them only when
> they are known to be needed (to implement pci-ep-bus sub-nodes).
> 
> 					-Alex

For the series:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
