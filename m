Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793621445;
	b=EOFzkM2m5vjjQweqWTJFv2rGfhHTRnRCMlTYyMudRyCN4vFlYYwlmDIPCzjKh9+CPvZl
	 0F8fgJ7gpvZciIhwqDX/rprQlp6bLyyf2bmYmncqfv3DTFnQGvIT8XwyVGgTDLLJM5WgH
	 ckoeaDB6zIVtrwzKYdi2HChwPNq/nO8eNlqBpIf8she7OKSzSAt57br8rOeBVeW4CeMiz
	 PJgdx+IZdtrlvcWJ0u0cGnf5/JjR18FmqUwt/JQsqvh2RakMRhlvlicGYl4Wd96IV+XNr
	 q6D5Yk2Xw29N1vVaZYVQqKUU8TAqU6fAhwTqGPfEc0roSCe3kcRbGdiicQlk/o1MxMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793621445;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
	b=YXPiUgwwGiMakpSb+o0YQStOP+oJoQyG3fy8fWeugIpxGbBbU8Nx9S2jS4ErcJzaYJfO
	 EDIeqR1KcaiRNeNEOdAwT+as/LKjbKnohDFFSipJlSsgcqBQpC1L6w+ffbrg3mU0lOebu
	 fEiBARz8qfuZ+DG1ki+n8UIdEuEUepg9psnLHaYhUZRm3blFiEnfuUiZ+OG1a2/xEEccc
	 kiJGADQzI9T9T0iww35nU5O8p4oWnTj8ianQhm9fb0RH5VoRwx049O+wkeQiI4kjeeQsA
	 HnUzIxzYNubh+zDJmOYzOxgwWQoxrIEtKO21kOIuRxtBKBXf4nTCpGr+B1pXFyOPQew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTwzGaz7;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4152260A2604
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 12:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4152260A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JdUO5B8j;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GTwzGaz7
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29AMO11821123
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 12:10:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=; b=JdUO5B8jkzGJ1ghc
	dW46UKYpW53M6pudO7cL/b9JbRwchvbki93C49mCB+f/o0rUg+RAO+wlDA/rLu/d
	POQXRPEsul4VGt6V1oSZkT/9UY/5UzYwWAgifz5ty2DPyj+2krgzx+mZ3UYag3Qr
	wns7LaRerRJ8zdqa1pqGdp+q0ZDhs7krdryL12+/XXmcYIv7jkWuIG9HYu4WkF47
	mH44wm7A3MK2Fr4CSZdprKt36lpBewR/TAleQZiZTnzoeRwv9jh2EKErFQp2X/hN
	+V8J8Mam54afXT361VTH4k6rnsjZeMwNyBBUgljk4mdEZOAEbXef9vSbXYlH0fSu
	mMel6w==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4hk5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 12:10:44 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec78f43e7fso51455e0c.0
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 04:10:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793621443; x=1794226243; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=GTwzGaz7bcEyz043JmfvUDzGfgwtFJBnflnOkMHafWLP+yPDkTFzq7PE/o/lnl0KQ7
         R6CkJFlvaS4fdb53PVkmws3l5Vn2e00+1986yHA4kxCGADH5dKtHG43DMBPiw1aQe9XC
         ORtokr1QCO5ZKy9a0uRV4FSAcJfQB9T9ycCkbH8gwY4oIcBJFQrtEvNRF5Tjn3ciXcY8
         d8hZAK+0LzFdGEYNL0SEFZJjF6z6jJ9sEHtJ9YEsKcqwSveaccOTpAwqvMjrAUQrerWt
         KqRMtAgug9OPz3rwA0qLTDNyIBtQ/nlIrep9cndwOjFr+4ZYsyCYrhswzoQ/SlXJjjH0
         khVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793621443; x=1794226243;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bzLAlzP92TJt+aeAAGxzVz4it7m/+bBEGzrtRNprh7Q=;
        b=ncFe3j27/xI025WVHbC48Uom9bUXjAvlhkNbnTn+eRQe626rdmoV4SgBelek7Tw8zw
         BU8+6DuOeGVH9+I+2p0kYNTYrL2EDk2BW+s+TaT+6VWJDHWwYReFMdsIdt+s9ATYD/sZ
         1VNhgIKTfaNwRqiLY5ZCntEmRpViCp0UAPHcv9rjrbBVBk98R3sUkIhioKZr7kLb52uU
         NRvosfWib59jQlN9QVHJmi0UVluKOF2N7MOITspu0b9IsV0yCjfllMG/gLJvIBK8fEWO
         9FA452zC55in7Tg9m13v7GwVj8E57ETX5FHWdHaftVn6h79LZUsXScqQPfqA9uA7BGQU
         RLeQ==
X-Gm-Message-State: APuU4Z9L7lKOTW9ZOA1FUoY/r4pMekWSYb86niMVGShoBllUNYe1liWs
	TUfgTEh2XOtieciwThRC89ccBfG5WmRfaUSQVs0YzXkeGMbxK9BPy4Unq3p2eqaE/kiyEO+4cr5
	UMLPRx7BGXiUt+5bCvWruxMTmFK9PKiyHj0kJj3x4vKXXfn3NXCvbWFHDHAzQBC4YBzGg
X-Gm-Gg: AYBFou2PcgXRlSq3HlUapY6K3qI3NRMkaE6ltPqt0bu9A7qadkuxnus6WPr9HfakCb0
	CBpu2eC13aoTtW0MK9eKMT356onWGISGdzslrla3na84PZkn29J2+9PPE8YPBo3mCEZJgNSL9r1
	98KoQUEZeuXB565sOvPbstdzhqLdBhRgSpc3z9wIb+4XdWksxanrkJE8Rk/YzvfeuzFb46aH3XH
	tYL4ubD/zSv6wxQTKc/P4zwPN2Zt4dygK3eZxY4PyUJLCijciCYy1BM5NDXK+yQwLrobm0rp4F9
	G/3F5CMqFMMqRYk/jyg1Kiw7Pm478uol7h6IXZZodBEa/uh/D4NX3ac/7SyF97TPq//NjP3FqTJ
	cKTDFxKZDkLfZtql0o6c2APSDmrcsfsrMII4qeOCKJ8pzocAXVcNYiTk86u4jetK/ZvKoMtw=
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466813137.1.1793621443191;
        Mon, 02 Nov 2026 04:10:43 -0800 (PST)
X-Received: by 2002:a67:ee14:0:b0:7c3:83a9:eddd with SMTP id ada2fe7eead31-7d07227a935mr3466797137.1.1793621442660;
        Mon, 02 Nov 2026 04:10:42 -0800 (PST)
Received: from [192.168.226.248] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b51adb58e0sm1042549a12.12.2026.11.02.04.10.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 04:10:41 -0800 (PST)
Message-ID: <216ffb94-864e-406b-a844-4435b8ca47a1@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:10:38 +0100
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
Subject: Re: [PATCH v3 3/7] regulator: pm8008: Add mode voting support for
 PM8010
To: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>,
        Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, mfd@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dhruvin Rajpura <drajpura@qti.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Kamal Wadhwa <kamal.wadhwa@oss.qualcomm.com>,
        Oleg Keri <okerixx@gmail.com>, Burke Cates <burke.cates@gmail.com>
References: <20261030-pm8010_i2c_support-v3-0-995ed1ec7a72@oss.qualcomm.com>
 <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261030-pm8010_i2c_support-v3-3-995ed1ec7a72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: T0rRGOSoxKxpm9wa2AUuHTRF_IBNdktT
X-Proofpoint-GUID: T0rRGOSoxKxpm9wa2AUuHTRF_IBNdktT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX2OG2FLmRIhIa
 MJC+irmPjIHHYPukbqlGVBYX+T3fhzQlTcRqJNkfeeEFxBuNnw3T1WSyoKieoiuDhrhxuUX8vVT
 C5wQXUmv7Df4D3fDgDLLgZW4HZaiA4U=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae87dc4 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=z6bgTffeZ3ablUicY0EA:9 a=QEXdDO2ut3YA:10
 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0OCBTYWx0ZWRfX5Pq25R5mEhIO
 Ugu/xolKRZGslKB2ZkJUPb3J3M295GDyu3urSjdk2FepCMq1/6M0ICsl0dJDUzuGOoIiIcb8S5o
 BMeROQe+vE3avGZLx9CqME+ZPD131cCQfudPuWostXGUbjxDZJetBuhKXuX614xZRNHlSJx6vDn
 3EtSgLpmMq340yGyQbhEp8FYgdykg+WWQ5R0pCdTXdrmdV3UfcQYpsHT5TIsBjIzpvfDIM0S1p2
 vT66sflHxzZID0zKZsmuFW+rei/rUpv4Itc91SaJWkNX0BEXKQ6RM2L3SxJ+/ctIMvqX/RIawom
 eAwKMJkHAHCGTWvdPASX0imHkdHBKHgN+X7V1qqh8n8YLB3NHfo3sP6sz/HNe8hYCgUVuREIi7y
 F1eR57fQYCyFdOWxPiSzOv0Czs1rURnQrSdPkJOtaDytdmVP2uuKsTlJFIgsiR6YBsB6Cc1y0HA
 CS2JM109vGWaVBSaiWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020048

On 10/30/26 7:20 AM, Jishnu Prakash wrote:
> From: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> 
> Implement set_mode/get_mode support for PM8010 LDOs using the mode
> control and status registers to allow clients to vote for LDO modes.
> Mode voting is not supported in the PM8008 LDOs.
> 
> Signed-off-by: Dhruvin Rajpura <drajpura@qti.qualcomm.com>
> Signed-off-by: Jishnu Prakash <jishnu.prakash@oss.qualcomm.com>
> ---

This defers the modesetting to the consumer. Please take a look at
the qcom-rpmh-regulator driver and implement something like this:

static unsigned int rpmh_regulator_vrm_get_optimum_mode(
        struct regulator_dev *rdev, int input_uV, int output_uV, int load_uA)
{
        struct rpmh_vreg *vreg = rdev_get_drvdata(rdev);

        if (load_uA >= vreg->hw_data->hpm_min_load_uA)
                return REGULATOR_MODE_NORMAL;
        else
                return REGULATOR_MODE_IDLE;
}

and fill out the max current allowed for LPM for each regulator

Konrad
