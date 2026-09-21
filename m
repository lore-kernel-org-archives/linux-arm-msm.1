Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CB454A0917
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:47:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789998431; cv=none; b=Q7w+XP/bp7TH5ue/uOfPXcsSQN272lFsY852ZncqvKbJO6/y0zAUr9irBOUKDqD3uzt0wktMthrvEtQ9em2l2aHFxvUGvUMXn2sxyMmLElMDcpMFc3yL2o7k6GFCwDlPC1aZmYRGhcnvfaPHYJMa/DuZxAeui0Rj9oD5d6l+wg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789998431; c=relaxed/simple;
	bh=wExMQHi0VsEIz8YCw/Flw6gdTc2CLzrRZbI/C7wfTTI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BNRobsRofsrZ6bYAid/T00LGFn6NimFMXIEg17hukX+CKD45dZAwGBhBg9ealZgwBVuWJWl/CmXhbnRx0vz7JPCOQqVjcKPqK9k9ajZ4yF1C3xtKeI07vrAzkr62Q018zKjh/Kke/SQ6ZnwPhgjod64C9T5Sxynv5KIs64Wjpy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cPzCIwA5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JK/cbkgB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cPzCIwA5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JK/cbkgB"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAdtw12091236
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:47:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qw3t/mWs9aOWgBnoW6d2vvKjBJYC5DsOvlhnmcywFhA=; b=cPzCIwA5jX3DywmU
	1HVITkOKj4B7k+UL3iJ5a56zVYzUB5jyFFP2+URe6bEr1JwwJoTZv0OprC65GVSe
	mMqLlBOmEJmaIIHljNf7/xpTZWoCOL5cZYrGy5/ZaQyLcP7hxqY7ZFrfILY2KqXA
	2a9SC1erMrqCXivYEsKbqjOuPHLIZADksb05nacccmkuORRKfTULMzYrerHqC0zf
	ZFwiQj932PHmfWymyjn+VH4sI77V6p/XC2XLR5kfq4myAFc4vDIiPSirk76mvA+/
	hhFDEtLgWWivC1d9STqdbOWNV5GziUPFPAn4Elb+2OG4Vox6wBTcsaiD87yAXE+3
	XAPRZQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtt3wtn4e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 13:47:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb687f82eso42616725ad.3
        for <linux-arm-msm@vger.kernel.org>; Mon, 21 Sep 2026 06:47:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789998429; x=1790603229; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qw3t/mWs9aOWgBnoW6d2vvKjBJYC5DsOvlhnmcywFhA=;
        b=JK/cbkgBNtCG0lPfCHrunQ+6zT4BmAZRhYaO5pjrBKlXhYzrHmzYH6pqzaiF6fwZ+A
         5w6MHGOM+CayFtGw6FS0gwcnIOugS5IMtBo7mI1aq/wljeZ8b5y8sc/7uNQpb4RWTv/I
         u2oQXwqGdMrUIQVUVX6LJPdi1dsnYvEbyeiJQd8XL8UhoBJWDxK7XpnJXhWgaHNI8BEC
         aSp2krfBMuGxrxhR0UTF2OfCppjV1+b66FsC9Ha8P5sQeXoH91BzNu8ges1E3+4DFeSj
         49ubvCyTIF3sMiqyqx6CMJRFCKpMTI8FrUR56oMiF2BiJvr2+EeTayxEcghKyDsFXgxk
         OoZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789998429; x=1790603229;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qw3t/mWs9aOWgBnoW6d2vvKjBJYC5DsOvlhnmcywFhA=;
        b=Q97Ty7YzNAf1QcgLSeaE4gJTGqesL5ZT3X7//ilW+t0ZbxuwPQ2jMF30iGZSNXWjn3
         iVkdqboMBCBVH7PI/GQ023gW/yeJODYfkkoPU7jOEDVsofAcnAGN3wrvtbET8NtZT5GL
         qfvxx756PEP0okHn+8SHC1hZ4BQ1BWfiPWUIeO2oDw0m8XO2U/Fdm3+RoqbETj85fjWq
         5XCLBaw8ty4Kk44/OnlNKkIhlTtSzu/ADeuFP2tB1v9A5P9DgyFgu7kzhbunO6QUtyE6
         JSeEVEyZ08APJdQn43mlYape52XjyK0D0GOHu0UayHPpCdZGqHDm4Q+hmMCOoVzeG9sH
         IAhA==
X-Forwarded-Encrypted: i=1; AKwUvBx+/0vLakE2DB8MGD1fi8Nq08mkugBNAkgbepJqqh5zDVoHBQ9YLfNUJ4L9Ay5hCaUD0geLVcRwn8Lxq90E@vger.kernel.org
X-Gm-Message-State: AFuF++kL8h3D6VdJcGPOK2+BYDVFNrmx+V8dn6Hn1a1NqEPJShTrRpoX
	8VXI1VQi8B5GsqGW0rk7yeZcIrs8q5ynh7elFWJDIUPQQ3Z6EkmDl/a8sWSii/knjQSf2EUT7sV
	3YTgeirklY9NKgx0pSkd7U24BdqRIXEUNWgy/qvkt1M2RMrVXjCcD5hw+Zb8L+33P9I6r
X-Gm-Gg: AYBFou059EJZSOsQWu7fUkUv0xDQMPnWnY6SCRSovmd3+UH2z6hvcl8PanF/LlituwM
	Mo4SUCa6VS23EXrpYosvqwiu8e+omsp6xpuebZk567DslBgwYOQxAoVV97NjHeZTBbTVrXvOidF
	CYpl6R83iMr5hRKj/UXkWQzLNPhOP3Ua9tVydO1TCXNmITs2t3OsNt6K3xulg40pZxPT6d7sTVK
	+J7N2LK6eHEB5mzj2sB86otwAFv83wrO43gzZ7fCBxbtzr96cTygbfJKwhwFztn9JSVFJ0h26TN
	BRGto2R6IwPbs/7JQ5LQ/raGZOrTT/IXNIE06Ep9MZkDTRHWxfHciZzu2epS+W5h3113sOTlIn3
	Y1bOnZMw+jR6+k+90xSROhCDiqu43ca3fUqI=
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2ddb1b98b90mr155543975ad.20.1789998428671;
        Mon, 21 Sep 2026 06:47:08 -0700 (PDT)
X-Received: by 2002:a17:903:2f0f:b0:2d8:d4d0:7930 with SMTP id d9443c01a7336-2ddb1b98b90mr155543555ad.20.1789998428217;
        Mon, 21 Sep 2026 06:47:08 -0700 (PDT)
Received: from [192.168.29.146] ([49.43.232.81])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc18032d5sm34621395ad.83.2026.09.21.06.47.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Sep 2026 06:47:07 -0700 (PDT)
Message-ID: <7b5bec8a-87ed-4363-ac62-3e14f7619f13@oss.qualcomm.com>
Date: Mon, 21 Sep 2026 19:17:00 +0530
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] dt-bindings: PCI: qcom,shikra-pcie: Document the
 Shikra PCIe Controller
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Lorenzo Pieralisi <lpieralisi@kernel.org>,
        =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Konrad Dybcio
 <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
References: <20260831-shikra-upstream-v2-0-406661d75afa@oss.qualcomm.com>
 <20260831-shikra-upstream-v2-2-406661d75afa@oss.qualcomm.com>
 <20260901-silent-pearl-shrew-c63a16@quoll>
Content-Language: en-US
From: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
In-Reply-To: <20260901-silent-pearl-shrew-c63a16@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDIwMCBTYWx0ZWRfX0nUVnRx+TJzz
 f0j0UHNFGRtkiKnAhzRC52FIpNDh8L6BI0GfSL04tJXe9SLwZIzFqSejp18FYQfPpAd0/q3Vyxx
 sDiEycz52vuKITFJvRvvGrKjKYfXU3hqi67VMIF5iCHds5m3whaYuS249xW2gRGdg1h1qF1B5lO
 5yFBq+ppzeWZ6ki/Tg5lmfxvFk13zLYjVXR44+QuBA2sU8RgDovRSQTcPtxiyNXzSRWjzYjkLZI
 +IOau3nqqPkbann19apc9MMhIRRa4lH8asO2HVqczlbhsazkomFs5/DDAQvE+Vm1ZAVZJZlkhu5
 pez25S8P723VRqhkrCG6HJhD6J16ZozEByypIdUP+Ia7+Cugn7BfQAW8ZPZgMZ8/DL3DSESPXBl
 Bm72t0b9YPbgnYRURddpkiJ+FsvTsEX0/hjRzbmmehLlzJECSKeT8pG/DCDVOPskA2ehy1hJqB6
 FRpusGM2w2lgWadJ5xg==
X-Proofpoint-ORIG-GUID: 0IryErwh8Nsj73cfPPyldO3rHI52Kduf
X-Proofpoint-GUID: 0IryErwh8Nsj73cfPPyldO3rHI52Kduf
X-Authority-Analysis: v=2.4 cv=dakVTnXe c=1 sm=1 tr=0 ts=6ab1355d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=gjxls31er4aXgMEaaoPcOA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=tLOCWTNIkaiYH31-AwAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDIwMCBTYWx0ZWRfX1qF/SbsnR/cy
 CMbSa7Gox1sWZO0vUfc7AOuaSBQLddTOZ+/C7tRJnPZsPiuTe2OJ7fqRYmc5N7gTE/0VGjqY39B
 6k6RuDfrVd3+SRDmdz4o2Cd8U8ZXc/Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210200


On 9/1/2026 2:12 PM, Krzysztof Kozlowski wrote:
> On Mon, Aug 31, 2026 at 12:56:02PM +0530, Sushrut Shree Trivedi wrote:
>> Add a dedicated schema for the PCIe controller found on the Shikra
>> platform.
>>
>> Shikra controller supports upto PCIe Gen3 but the PHY is
>> only capable of Gen2, hence the max link speed  is limited
>> to Gen2 to avoid link-up failures.
>>
>> Signed-off-by: Sushrut Shree Trivedi <sushrut.trivedi@oss.qualcomm.com>
>> ---
>>   .../devicetree/bindings/pci/qcom,shikra-pcie.yaml  | 218 +++++++++++++++++++++
>>   1 file changed, 218 insertions(+)
>>
> What is the difference in the binding against Eliza? IOW, why does this
> need a separate file unlike Eliza?
Shikra does not have the Config NoC AXI clock unlike sm8550 / eliza. Apart
from that, minItems for reg  and interrupts need to be updated. I actually
didn't see any bindings with a clock constraint added for only a single 
compatible.

Do you suggest constraining shikra clock-names and other properties 
under an if
block inside sm8550 binding itself ?
>
> ...
>
>> +            reset-names = "pci";
>> +
>> +            power-domains = <&gcc GCC_PCIE_GDSC>;
>> +
>> +            max-link-speed = <2>;
>> +
>> +            operating-points-v2 = <&pcie_opp_table>;
>> +
>> +            pcie_opp_table: opp-table {
>> +                    compatible = "operating-points-v2";
> Are you sure dt-check-style does not complain?
ACK'd
>
>> +
>> +                    /* GEN 1 x1 */
>> +                    opp-2500000 {
>> +                            opp-hz = /bits/ 64 <2500000>;
>> +                            required-opps = <&rpmpd_opp_low_svs>;
>> +                            opp-peak-kBps = <250000 1>;
>> +                            opp-level = <1>;
>> +                    };
>> +
> Best regards,
> Krzysztof
