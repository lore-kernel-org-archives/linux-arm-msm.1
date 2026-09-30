Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0455309F08
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:17:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790767063; cv=none; b=W8EAhQHwRglA1S6h/flotfoOWH4DPJK8dHrR13ORIZYBHcQgg2ucKQVA6bXWzxOoFzh3Bp/fGSnjMIYtc7vLStdQLJ6OijQUnhkjhZB5unroF2r4ZwFk2h8ZDqd2yOBypOx4YH4v2kQ3w77c0b5yZGj07EQhtJawvyD/gj1wiRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790767063; c=relaxed/simple;
	bh=EeqgvxyLfTni+7IKc4kWoIM6ayYzhXt4o9qX/MOfp4A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Qt0dcjhoM+klezeLvpKhWB2Zr8jlwppjSN7YH2WhsyVEfOMdoeoeoJVPIIQ/yCtDdHJwQQWlYqfrvomtfWzUHH/vJ2C0xQy+QVXUUTG3sKTXVEkzBN7Tqa0e+dbm7ndSMkh81jH8UOhykODGj6/KaPQv+Baw1rh94GQd1+itXwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MAmalE74; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WSjwxPbq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAmalE74";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WSjwxPbq"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68UB7h1T2678407
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:17:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=; b=MAmalE74m4oGRRkZ
	YgpBQMEenKNVe2j7WtcEurb35fYnSCR7ilC5hYyibKe74uJ3X6RzHM6bj79DU4Cs
	/iF89I4rpvZtwroibcOs4PGkoDgA9bnHbDlLhot6OmuYMvLRBclnfhAeZpBf6B4P
	wRJ8Rx/srv/10GUtUaelmBGHdaIYS20C6mTl6IC1uN2FgO2hrUIImFsbhqUA8Kcb
	rnfnJtRho3OB5h6vwihZhjp6Fw2Hmvm5ax5h+mdci3Q0QX+kcT1G0sjgmdZEacqf
	ZiJkC3eQCixEUMXYhKauFsS6AQW9hZIAhDrxitP4DbPgNStv01BQTlFwiVLUbrm+
	RQ45WQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h0smjj666-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 11:17:41 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-90c4d46037eso7724986d6.1
        for <linux-arm-msm@vger.kernel.org>; Wed, 30 Sep 2026 04:17:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790767060; x=1791371860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=;
        b=WSjwxPbqaRfjlvBig4tQE5Nx3B5WZrjNOMpnl8ZhSxHJdGKx50Dd/0aj+EwJHKLV3M
         jl5SqrkIjJoFOBn+IVMkHemyZjD8Tp2ku8Uw8cxDSud210MQNtPhhSp3i/Pch6Y/ETiU
         MNQxpKSG1ITSHyFtIwZZAj2GMXsIPOTdeg6qPg1DuzJIL2et+9EE4AoiUEuxpg9XRIxr
         tyJ6YvvbVXzAafe8eSVMnvnRYyV3YhW/5AVrZSv8OFVp3HJkKhahi0R+1wW5R/p2Clxh
         KzSOsH9JNfyelRxho9jkK3JpFmJIQjRAGHcjGdX5dWvA53s+rsLsHxn3B+ZaI2PYvD9i
         XzPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790767060; x=1791371860;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0GWiw0pJyWEuZ86Zkf+u0yClTNN1vxiSDR7TmXjH+PY=;
        b=c6rSINFuzLtwNXCbcuioVKhzYREKvxQBTzcoLBfrJOO+onagftUKD6nRz3kuJcGo8v
         /dOVrJR/nV8SKD+JiPzRM/i1NxKLOJhDe9pHUh7CL79pVjxwwgmHU3qd3KqwurYB+Lf/
         mNe6e2/O0KS6IdUp7ZfbgCe4wDDZhX8+CGq9Vty7j4yutQm3L7zP3NNp+rRUqM3QLIvJ
         rq0Iyx+COUKYULjzXnjkbrq1dK6LcDE0lopL65rqxyZTz50Hd9HG2GNY22T9B75saGbb
         76Y+6MZiDvlbB+Fl1IdtoN8uT+tMBcnrI3RtQJQ7IyeN96M1cHoVpKpcoOV2U0MP1HTO
         3+jQ==
X-Gm-Message-State: AFuF++mhtLpypHTlw+N7awf5G9H3ei1AiyFTNx8wQ8sUsS6yb9Gxj3Hv
	XdcNzbS2cE8BJbi0/r/FotjIxdqRfn2m7YppX+9N1h1guiCyTts5L3O2A4fCd4FY1f8Fya4Xa+r
	6tnWhuv/iFy1T8Ya7I2G0LTS4153sij/uVzu19g6zCoZzOKkVJt9owNirUfqKswewu/4j
X-Gm-Gg: AYBFou0J1Jilm3VTgSgpl1UIXl5ORdQnv+Bc8UaSKfU8yNczwAgVVgTkllfBV0MUlPm
	dKAfpipI1ymypBZcXseKZywzPg6wgp9joiTENtnGIv7XzvPW+KvV4c9EjxtUVgAh9bnj1LHiUHR
	yA/I0gFKLJk4Lf16WewP217MqcFdEDomadsulygWUWttpgn02huzM61zGljtgG+ywb+zZsgaW9H
	uk8/DoUzpEdMEasXlFgO2t4sN1Pjw2M7ZMfminkA/WFPko8HSMnc+1+E38LqMg7T4XJ+A1hSlmZ
	yhvJtdkEIac1XPya804cMoK2cSvmPBu1/KAPK9w4JJbSxC9AqyYeK5qcCduhXn2GP4bL43uDWg6
	x/OwvpiLn7eLRPVfJn4/DsQ==
X-Received: by 2002:a05:620a:4554:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ca97b852cmr133007985a.6.1790767059799;
        Wed, 30 Sep 2026 04:17:39 -0700 (PDT)
X-Received: by 2002:a05:620a:4554:b0:93a:ec4:e5f2 with SMTP id af79cd13be357-93ca97b852cmr133001185a.6.1790767059096;
        Wed, 30 Sep 2026 04:17:39 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ae1558b289sm616849a12.15.2026.09.30.04.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Sep 2026 04:17:38 -0700 (PDT)
Message-ID: <361320d3-4c4e-448f-b883-1f9d6115f7a4@oss.qualcomm.com>
Date: Wed, 30 Sep 2026 13:17:36 +0200
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/7] arm64: dts: qcom: hawi: add iris video codec node
To: Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab
 <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
 <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-6-016ec3d24b79@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfX0uW3TVlZeCtw
 Y9NHrq3Qrf+Hl+IsgZIRedleBw4LWzQYsXv64G9YAicux0i+otX4orFHSGL25ppr8s3qOhzK/j6
 +YoJ1iOI4P6zjegZ3OCgFxwPLmNanq4=
X-Proofpoint-GUID: UE6TmylLG9XhAgMqgyirhQD7WAsjAQiw
X-Proofpoint-ORIG-GUID: UE6TmylLG9XhAgMqgyirhQD7WAsjAQiw
X-Authority-Analysis: v=2.4 cv=KfxHIgYD c=1 sm=1 tr=0 ts=6abcefd5 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=DhuRJU6gBchJA4Z4gf4A:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA0NCBTYWx0ZWRfXyU6pWdzDNBkt
 VdRFbpOt+Gm2VamODKXQtoj8TSYYDrLV2Ykc2gOR5reLpK10VtBJYkP8sB3td0Z+geJPEDTcaMk
 vTYnZzdbNlLsjjQY4rbVS+QBAe4MirCrzNL1fQixP//PKbmBsr+26rNasBk9c/nZ+y4Ie8NcsXm
 FUCBqnaJy2syMCWzSC33vvuzfCB/eFjm3ozjSJJKxnRAYoDKoYlvASHTkjFWdczDos8SShZ8SbZ
 0BpGhthy+vh59E8TNMR0zR0F9SH1uoHSbgyvuyyGPAEcz1EOBzSSEOkp5OYJPE77EUolbmm0UIj
 lM/jiaPWede0VaYSM2JbuCQXGhWfjZZ2uwXt8yG/hNXKphQnsk3IQEdzZyGuPjL/ByVfUzQ2D6z
 YwWCMlJPANafT1PGG+IQipwPw5MJ2B/SxuStOhxc4EnDIgjW++2rAFrc5u1S1MZaWtZ2itTyzmj
 tgiYeCu4Ks1ro6YRjoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 bulkscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300044

On 9/23/26 5:27 AM, Wangao Wang wrote:
> Add the iris video codec device node for the hawi SoC, describing the
> register space, interrupt, nine power domains (including the
> VPU5x-specific mm-int and cx-int domains), thirteen clocks, two
> interconnect paths for CPU config and video memory bandwidth, IOMMU
> mappings, and the operating point table covering 150 MHz through 1000 MHz.
> 
> Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
