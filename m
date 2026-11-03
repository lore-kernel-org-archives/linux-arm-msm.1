Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793703011;
	b=Awv+62Vs2KjFQrS+eSOeEShfiKp98TVvvIAbXsKefNbodQ2HXLxvgFsUcteMW3dbvg4O
	 sSr5tosJLYNmR7XopIjgi4B1WI48MQNdq6sLr02/9gH7isLkOBoGXpe/Xp42m3kA7uAZA
	 i7Pym/GiyO5FzSlf8YcewEYdZACJUqInTBiALagPIKpKB9oCSzBk7iJxw5JcoAt6DcgLD
	 XmgNA/oXnYjnWdjz3JlAu5WvKUtA5EB8hKGSfqd2DphSsM+6+JdKTX7803waCAnrRNLD4
	 8MxBcSzyE1eMFfDfYDJ6WfWel4cWn8PaBo7Ei6kzOsDoPPgJGQn0xJ24shdaydK/fRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793703011;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=;
	b=TpHH8y4sngXxF7RqmXa2BSpaXABL55K2Ez71/Hmkut7I6GK/YZPUnJw7GJE+9yrwv9U8
	 wvA4+L9BOJOV3A1A7syhVoNPIwKVIYi0A93zRUpeUg9OCoL2mTNugWuS3xFd5qRnc9WH4
	 i5YmnfIZocv1772yocA1mU5hw7wB2NihUX4OM/WlDCLtQTxOVm4bbd7HuqxaWuNrDY0Gv
	 APMa2nIT8zZQXC64/7TyzSXUMkYX8w62uJsjQ1PhjWR6wxZi3YLkMqLgRiAfaA3MhcEV6
	 kD+vx309HAiF7KdeVMslvlj7ETyAIMoWjGd3YK1C2gj2Dq9DeTA7ItNvFOv2l/S7ihQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZJCCqn9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvOsRQ4S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19362606C5E8
	for <linux-arm-msm@vger.kernel.org>; Tue,  3 Nov 2026 10:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19362606C5E8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PZJCCqn9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GvOsRQ4S
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3AA8tQ3526210
	for <linux-arm-msm@vger.kernel.org>; Tue, 3 Nov 2026 10:50:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=; b=PZJCCqn9PIF93YCj
	bsDrUAcIaAMX7chydQEVwshzZTWAPmRhpL6I0m+iFALgsc+HqipijCebGazIwC+r
	n4xhg9IjMjcIJEfpfgQvhodT8LXaqHWlbfVxCKClHAG1lEyZbxqIDRj2hQkV7LGs
	QYPSBCpYxQbzo1NT8B8jD5AEOSMNmOhxmNJOQuy5MLF8+tTtOdcbGUCzQgwrtjDQ
	BQIVZ2jwChsjP8sz7INu+HoL3lvMSceVfrKzL6ZQvpHtVcxdTHzcYD5vt8R3Ntze
	FpzoNRiWGrT9fOGt9ZG/H+jkrCj3aVhYf1stXrYIcXY5gpGZNVv83+QThrDHzWqC
	xTd1fQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq3uy2g6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 10:50:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3abb4c24125so3223250a91.3
        for <linux-arm-msm@vger.kernel.org>; Tue, 03 Nov 2026 02:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793703009; x=1794307809; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=;
        b=GvOsRQ4SwQWHYufEJE3qpVngPXS9rnvKDsWp0i6OJfJGo7bJGxspVKuX3QblpJJaVG
         33fqCWgTsdp8g7YPK+A+F6EmK/kIQs7p4RsKzz2Fo/e8YX5orQ6lLdnpyfWd5sp5w9ut
         0l/65/0hP0WITFhEz0Nw9TlguNLkI3w37D0XLr0CaAnVx0sDvpdzvASXIeHHJFwdQhf+
         5YOktwj8gZ/xNiq4Si/D1EV5x04S2yuRSytk+XQg+UFwS6SXeapxuOjf/FUoxCxVcXeS
         NqDcwP7z1AFGX3fb8R+dUsmZ3mR00eZ+tDxnG9c7R35DY3qfo05C1RUkvgg/3mXnYgEl
         q4Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793703009; x=1794307809;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0BtTPxJY+SQ3iqv7Fvtvh2D/RiM3yHOC2GPAR8vYW/U=;
        b=ermB8aDhV/fkSy0PCto9Z4ltkRGXwvvSvEuuEvOGkLtId9GhAvELc00F4rmNvD+997
         9O2icaa61gij06qcgFjtUv0FTXXT7luaoD83BVzC45VoJD/OOAxF+yu+rK/UgV6GLtp/
         DKdPUkP7+f5oHBYv9ancKjlUqixNq0elWnMLLKrmrgnzqHvNXmcJNA5TzDXC8mUF2f0U
         5ey4pyY1S9Mi8Xoj9IouRlDYbmZJut0gWHG/9gz+VtdNf6ECrE/Zs0rqNYK5LlrwFDQn
         p7sHd0mUspWywI31iqwij4ZXQfJIvuBA/93HUNynPOqt4jkJK8ab2kTUzNLEVeQHq94p
         OMJQ==
X-Forwarded-Encrypted: i=1; AKwUvBwjQ19O5xIjDOacHL1LoOLMHeGIAqMeu23zcnT5rk8zjjcriN1Qg/Od/94btU41mMLAscD/HXzs7Hjj8sRC@vger.kernel.org
X-Gm-Message-State: APuU4Z/BmB4VEFSbXgimulPVwky9WyZSIiM1XymniGjg1mX+vzgA94/x
	MsayFUXuDRiUZxmCzi3j7NWXwp1cDgHdRrixZ0hPokDKsFHYYfcH2dFpirWUiXug7CMU+pGlw0w
	EVmnk+AuGZOScdNWpId7GpvQxdIpo+Vrzn+XPyrPIXjdqHBQwN5igYtUNyxSGyojunaIn
X-Gm-Gg: AYBFou2tc4t4hr1SjC8z7zocSH5i6iysU9ldhtrZZetjXqg022KB4th1NatQNTqy3k8
	zo8FqrxwPd3ZLLSnVmfs4tS8kV6rEFpo4Zpy+njA7BJbbnXcUBW4j1cOk4w0NOUJivdOn9wmHmV
	8hXByBWKzbfe81TvDxoYxYvnZJPDSxLAxw6G7jFvC5OaTidwrmX0tQNGNIB3wBp55/47vqgpnzT
	4WRMc5sFiGLYQ1hPebvqFcO3YuAc9Ego7+t10Lin09CBLREuk6oa0ipeBMG9siFnNLGVfv9DcYk
	PC8QM9r+BAKRVDD7KPl4odSx4iwroeJvoCZt9dstKLicW5/sgIRNYpHPDnHS8yo7NakfpOMlxas
	B5wyjiNxeP2ILa9b8CST8Xoar3WjrkvFjAi7W9LY+CZToe1y7K8L3ZkFxuRzG5zy2CFEAcHrGyz
	go2LCZq9T6cA8korslUYt0xF0YQ3qKSka2P1tmQ+IYhA==
X-Received: by 2002:a17:90b:51cf:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae8982cc41mr8675061a91.63.1793703009495;
        Tue, 03 Nov 2026 02:50:09 -0800 (PST)
X-Received: by 2002:a17:90b:51cf:b0:3ad:818f:3da2 with SMTP id 98e67ed59e1d1-3ae8982cc41mr8675040a91.63.1793703009003;
        Tue, 03 Nov 2026 02:50:09 -0800 (PST)
Received: from [10.133.33.42] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c583d0asm3915104a91.3.2026.11.03.02.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 02:50:08 -0800 (PST)
Message-ID: <d4750da2-0e89-456e-8d36-a34c3420b285@oss.qualcomm.com>
Date: Tue, 3 Nov 2026 18:50:02 +0800
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Post: <mailto:linux-arm-msm@vger.kernel.org>
List-Help: <mailto:linux-arm-msm+help@vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-arm-msm+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] phy: qcom: qmp-pcie: Add qref and refgen regulator
 vote for QCS8300 and SA8775p PHY
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        peter.chen@oss.qualcomm.com, qiang.yu@oss.qualcomm.com,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260916102023.2054761-1-ziyue.zhang@oss.qualcomm.com>
 <20260916102023.2054761-3-ziyue.zhang@oss.qualcomm.com>
 <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
Content-Language: en-US
From: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
In-Reply-To: <ded7f87c-74d5-423f-acd9-efa83a472c2b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SfzLEVVDvFvf28rU0biFr8rLFktmG_EX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfXw1U9335wlO8k
 MpVN76IuF4LQaEOksA9RjbP2iJ0yA6dwDPalKht5Nej2NvQ5yPLT6RYykI08zsTAQ9lp5037/45
 nLdIgn2EVrAFadQgQNBcCWbGWLtNMBhFEcdbimCpHgzh9luasztrAoYsJDf7BhumAF0XOoa89Xa
 j0jc6S2kFsdzHLRKqC2L0d13AMhuzJrfwt8a1znO0gQ+fyKAa4hFMYV+VWSH40ZBuc7CUX0gXxV
 EKkJe66Q0Ud59p/Ipj0zM/3ab2Tspq236XQPVv1mltyS6o/dBctjTIoHzxyYcIVNJPCfExqK7DI
 nL/Qw1s/+T55UEDGiIXoFmmtXzD5bXprfVOpdUxMi0KVvDb8+BxM//KxjaoUPqd+9X76MlxZOEp
 ZngK/xVfhmGUebo2z+NcjfQkHaOyyXsIUZ9sQVug0ZBTQnfsn3rN69M3cUx4NJ9PBNnLuhc+ks+
 Uq3A8Fv8gyWaUWvz0NQ==
X-Authority-Analysis: v=2.4 cv=VoG2kO2n c=1 sm=1 tr=0 ts=6ae9bc62 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=3v8O9tVSiMwV8kAMF3cA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: SfzLEVVDvFvf28rU0biFr8rLFktmG_EX
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA0MyBTYWx0ZWRfX60D3jNfNVivU
 z8Jb35Y/8Sr2bWbQLLM/LX4eI/g+Bp7yNA/+7BYHYyXqW+AlTXoCxsLiLxqysJIVnueq4Ezt/j+
 ThAiBqINn534cSOYEc6NzWA6KH5lNUk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_02,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 spamscore=0 bulkscore=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030043


On 10/28/2026 10:37 PM, Konrad Dybcio wrote:
> On 9/16/26 12:20 PM, Ziyue Zhang wrote:
>> Add a new sa8775p_qmp_phy_vreg_l that includes vdda-phy, vdda-pll,
>> vdda-qref, vdda-refgen and refgen supplies, and use it for QCS8300
>> and SA8775p PCIe PHY configurations. This avoids modifying
>> sm8550_qmp_phy_vreg_l and breaking SM8550 and SM8650.
>>
>> These supplies were missing from the original driver, which was found
>> to be the root cause of occasional system crashes observed on QCS8300
>> and SA8775p platforms. Without voting for these supplies, the PCIe PHY
>> lacks stable reference clock and voltage, so the PHY never becomes
>> ready and initialization times out:
>>
>>    [    7.303119] qcom-qmp-pcie-phy 1c04000.phy: phy initialization timed-out
>>    [    7.309948] phy phy-1c04000.phy.0: phy poweron failed --> -110
>>
>> Note that due to a hardware issue, QREF actually depends on refgen3
>> rather than refgen2 as documented; refgen3 is therefore voted manually
>> via the refgen supply as a workaround.
>>
>> Fixes: a05b6d5135ec ("phy: qcom-qmp-pcie: add support for sa8775p")
>> Fixes: ebf198f17b5a ("phy: qcom-qmp-pcie: add dual lane PHY support for QCS8300")
>> Signed-off-by: Ziyue Zhang <ziyue.zhang@oss.qualcomm.com>
>> ---
>>   drivers/phy/qualcomm/phy-qcom-qmp-pcie.c | 16 ++++++++++------
>>   1 file changed, 10 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> index da83358c97ea..ab81c6e584a8 100644
>> --- a/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> +++ b/drivers/phy/qualcomm/phy-qcom-qmp-pcie.c
>> @@ -4094,6 +4094,10 @@ static const char * const sm8550_qmp_phy_vreg_l[] = {
>>   	"vdda-phy", "vdda-pll", "vdda-qref",
>>   };
>>   
>> +static const char * const sa8775p_qmp_phy_vreg_l[] = {
>> +	"vdda-phy", "vdda-pll", "vdda-qref", "vdda-refgen", "refgen",
>> +};
> I think we could grab them unconditionally, as QREF/REFGEN appears
> on most/all SoCs (perhaps with regulator_optional_get so that we
> defer the correctness of this to dt-bindings for any specific
> platform)
>
> Konrad
Hi Konrad

I think that on future platforms, qref will be voted by the tcsr
driver or another driver, depending on where those registers are
located. The PHY driver will only need to vote for refgen1p2 and refgen0p9.

If future platforms need to vote for vdda-qref, vdda-refgen, and refgen,
they can simply reuse this vreg_list.
BR
Ziyue
