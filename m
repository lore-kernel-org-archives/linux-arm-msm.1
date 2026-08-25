Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B5783A7D9E
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787653494; cv=none; b=bg/Uk5ADUmDlkYnQ2bQocz5vw8W/aOCgUwowwhHmWra+YZKpYClMlVJ8AqsqcFvsw7u3pLCzlljc9IJH1OmLo39joppapMQO7ScgFgbz/L+pGSLxpFEqvEWKN/9gvAN1DwpFB/bColO1HLudYbVrVE2l7mCD0WyD7h7ZhP3nwLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787653494; c=relaxed/simple;
	bh=+1O8zcPH7hVoS3IpyQ8fN990OVd9v0c/oKWCx+oF+kw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tL9GD/sIJJjFRwMv8NbIBvLC+mRvTqr1MlkG49gtthBHpXIB697ukaP2nRaGMOYiqXX94waR0Bx4gtWKE7TrQHLk/jb98prISmwwPUZWKN7ed0mWdBzIMFRpGuaxjYNFaeIBgrTfTg3up1TfDxnbFQsSER69KnRs3KaaLpaOiUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MscZ5cXP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Vq1zriFq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MscZ5cXP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Vq1zriFq"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P9YLgU1074721
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BCkzDe8UUuJ8H8OkZTHBnzntO0+JrL7+2wmBt9oT3M4=; b=MscZ5cXPxs2JqqUO
	KE5G5X/FyAXSp84u40cWDBT34+99oV1Yr8QGixtlbagmwrajIXgit9aTlfieBtaN
	fpXEUeITOcKVIn01jswkGuzwuO5hR7IlH/pVz5giLdLZW1I9xmy9IXgyqMxhwS/t
	eHjP94JSBkVNuzyBj5VsPEAm9VWTiYanI/vSMqjYYztrJ06r2N+aPODk4alwxrkr
	GoKQ93rUdCY52/mhZOSl0YIyGv9/dmCgmaKJ2VcVzFccEQ5FGfr7iJ9w57TQakUS
	E5mu3kC+Ctzm7hhkp3UfsaiToGcsAzG3IH6MFccy3lJPRIE39ECxZnaiNF2Hfx6H
	6zBZuA==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g98hp06p4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 10:24:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cc1a439db36so2217697a12.2
        for <linux-arm-msm@vger.kernel.org>; Tue, 25 Aug 2026 03:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787653492; x=1788258292; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BCkzDe8UUuJ8H8OkZTHBnzntO0+JrL7+2wmBt9oT3M4=;
        b=Vq1zriFq/aQJZt+I5ZmKep+TEl3xJO8yfuTs+XrypSPY4SW6U69hxadBfcXGq1cn0N
         Hnaw8GZR3H+o+o899VWGwXlXfjrLVC66XAl3z8vUgmoxc3h04Vgu9mMLD0MJtZyMe3+6
         Df3JBcwfRIEQdcSusX0v0phlh7yUATBEdSnLz3mA87in5Q4bbIXoyz2aJdKmsFzpGKuE
         /4ku0UuZZOT+dF8hCruzsWLOXiNs3INYlimhH1Wyt3sp6Eb+UHDT+6aNBTuAkmaZb6XV
         QI7PfLzUwZUZIGdjYSKtUfKiSy0IGb864+bKcekL5PaaWeabnkP1x9w7h4fPQL6s1h2u
         AUVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787653492; x=1788258292;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BCkzDe8UUuJ8H8OkZTHBnzntO0+JrL7+2wmBt9oT3M4=;
        b=X2wQrj+4Ee7JKdgpcy0sT5xTcp7oZdXlm1iexriKONX7wi9VRG3Flj38C6qJnWNUAY
         mA0uDgO1+NUKOddFGDT1HlcnWOThxMFlJOTW1Z3x+XT1+I+eMRitw40fNNcnG1rXVwu4
         AJN8vM3trz2YJS6pcttB5ig8COkDH01GsMwmj0Gq9My6HNoWgAxYU1vGpIDF6/ZDvT2o
         qFJBFU6DxWloPWOB3VhqgWGYFw9GYhMKX9nd5FNSZ6CvPwsZphHENrydrhUrgbG67nLT
         6Ym6veuZe5/iEibxAVcTyf59YKi3uekau9Mqpi+k2MykL+vsi7cHhKb66BjKuiXwMLFl
         nCXQ==
X-Gm-Message-State: AFuF++mHgr3R9aUzitBbwueYPk5HcZzZM6CY6O2TbRy1sBXpzX9sHuGv
	j2B4IVz/gECrrLbhig6kuG9/xWhNUAGl8b6FMscGv7oGnXO/2+naCemt8evof+cYcpe0MDOOes2
	PRqwA4BEz636LB6Rqf+ybgfKTfykQQPIzmlUTmCYVU2HQQnCXnHoiOG3Q+FHSDItGxZMG
X-Gm-Gg: AR+sD134uZntsie40dhxgE7Sj9wMQa8CEmqG9kYeUGiZe54zLyY5T0qJvrgNq6+OY+C
	Oc8rHxjuhg2qsysrrYTF42L9DwoYn3sgmsFCdPI7WuZTF5UBMjGk6u46BWkBflivVU1XE5wqUnh
	9+TbluraaFkEuH+YpewB5BS5yl9Ir2YBfqJMwYM1IBZcvI1r+a95VI5Fd8NgDMt7bz8BcVU5w1N
	/YOF5LbTxUIrUifF4Zd31qco1zP6uAjiTDQVWNYmIarrmGR8bsOHv2FZ776SXYsdEndglAlGAdr
	Qkdo3KVNd6OwTpUJc9L93oCZkIuIgQ6b/JPj5qrBt2O+C4zB6XespsRZPSd6jAWA2gZ9HHQZ7jB
	Ghx4NrqrOwSN91owvjq7zjgo+4Bs16m/ZNk/Qe+IwOJnZR84aG0MIquGWaRR4DA4aloYlyYsivy
	pBEEu4Z5GcuepkJjVDuq71Dk6dI9o=
X-Received: by 2002:a05:6a00:bd02:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-8523c4c1dfemr9316860b3a.0.1787653491882;
        Tue, 25 Aug 2026 03:24:51 -0700 (PDT)
X-Received: by 2002:a05:6a00:bd02:b0:84e:24df:3870 with SMTP id d2e1a72fcca58-8523c4c1dfemr9316782b3a.0.1787653491414;
        Tue, 25 Aug 2026 03:24:51 -0700 (PDT)
Received: from [10.79.116.190] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8520eedccb1sm2886485b3a.8.2026.08.25.03.24.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 03:24:51 -0700 (PDT)
Message-ID: <cd434320-4bb4-4937-aa75-6f0dd081049a@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 15:54:47 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: qcom: smem: support Glymur DRAM info
To: Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
Content-Language: en-US
From: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
In-Reply-To: <20260820-topic-glymur_dramc-v1-1-f714eef34e4d@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ERrbjTsRl0clmtQ_PgA4Ac7RBG2zhuuR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX/gs88TJfv97O
 opGEUOabnJgaMpMDJSsFHVYEoPRiI+p0SDCvoxU/Q8cUg/wTljwYH1va5p+7spcI8vJDdrvB5zI
 XVFE/AhSt2ch8pxOoZhE/R4KTfm94f8z6hJM/K9CAZ63AZQYXXYcjvLBAWcyBJW0/M8TBvni9jM
 qEwnK7931voSBC2xKBupx8BdanZzcLYdJbbnJTkzrXiGbaedAMVlgbtimsrTWJ7nsST0WI8Zlkw
 ohgLR30E3IXwLzMMFfnvNiam4NUKo79IUd2p4Itj/LA2QbObmgzMYtjAkw3hpx6ef+Mah8rSVXg
 7YPs4fLssHx3Kl4VEaFu+OCzrdUc/znFbg0PUKK/4Z2lV+xuSsxeGsi2kEBT+VBW0zr7E3EX+ZP
 DaZTMso19CSVgQvsXDouN5QfLt+l8YlQfmGwDGLbeh/Enn0DzvBevCcf/icqyRuLDVijXbUekeZ
 TpebY6p0GlPEUSX56tA==
X-Authority-Analysis: v=2.4 cv=B7CJFutM c=1 sm=1 tr=0 ts=6a8d6d74 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=Jo7FG_STVPlGlPSEqzEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: ERrbjTsRl0clmtQ_PgA4Ac7RBG2zhuuR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA4NyBTYWx0ZWRfX/Cz8Co1qHd7G
 xEwOGImKWSTBKc9bRR9PfhP5FwncV0bsKC8TH/V+gQEzBIndwARqRcqElCTlDNcZC8vcdSMW3LE
 D3s5+pSuY/qHZwqRucXX+N7uEaJlcYk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 phishscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608250087



On 8/20/2026 10:00 PM, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Glymur firmware provides a version 7 DDR-info SMEM entry whose 872-byte
> layout is different from the one the driver supports today.
> 
> The data contains 16 channel descriptors, 14 DDR frequency slots, four
> 4 DDR region slots, a 10-entry SHUB frequency plan, and v6 misc information.
> It accounts for 616 bytes; the captured SMEM entry has a further 256
> zero bytes.
> 
> Add a Glymur-specific version 7 layout and recognize that complete entry.
> Parse the DDR frequencies and highest-bank bit from the common fields.
> 
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---

Hi Konrad,

I tested this on the Glymur CRD.

The new v7 layout is parsed correctly: the "unknown type of DRAM info
struct (size = 872)" error is gone, and hbb reports 16.

The frequency list is almost correct, but the highest entry is truncated:

     # cat /sys/kernel/debug/qcom_smem/dram_frequencies
     200000000
     547200000
     1353600000
     1555200000
     1708800000
     2092800000
     2736000000
     3187200000
     3686400000
     4224000000
     466632704

The last value should be 4761600000. This is caused by a 32-bit overflow
in the frequency calculation:

     dram->frequencies[dram->num_frequencies++] = 1000 * freq_khz;

Since freq_khz is a u32, the multiplication is performed as a 32-bit
operation before being assigned to the u64 array. Using 1000UL instead
fixes the overflow:

     dram->frequencies[dram->num_frequencies++] = 1000UL * freq_khz;

The same issue exists in the v3, v4, v5, and v7 parsing functions. It
was not exposed previously because their maximum frequencies were below
the 32-bit limit.
With this change, the last frequency is reported correctly as
4761600000.

I can send the overflow fix as a separate patch, or you can fold it in 
—whichever you prefer.

Tested-by: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>

Thanks,
Gopikrishna
