Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793607351;
	b=qhcThxAFOaKypBBmrXVMDJaZ+hO/gt88XjZfjsb5HU5cLZ6V1RyC3vahgXiOFOzvaALy
	 4LpyxrFETuowqnD0ZWgHMEot+YQwC2CUmwNcDBfC6PJbjCCOWIAxkxOsYSrDZZpsXUT/o
	 qFb/5O+BVUpyG6tMXoGLG6tuXDR9mQmQfUHKUXLYq0akt/O2Zw/MbY232UwWhQDO/3beY
	 anuSLPh97q63yvUNsLecgirNdOsh4t/ctVwp3vo09UnTP8y5QkXDiR+Odu/JuWyXi9Q7O
	 blF1ZPq3+fvSnpAveMiJ9FsZMI9ABBJLqNRT12AklJ83j2jj0Vfn1FbK2hse1aZSEyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793607351;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=;
	b=bZCkJZmb6B3KFdCbpB9k4F9U0+D5S7YdXwMo27Vco4X/wx3rXzcd0pJrjw8n9N1KtTBa
	 9fqcT10UthvsA5qi39qVjIwwwffOlPVDly+6Lk+VJbKuv6QZKJSejE5DsLaQBayhLHLOs
	 XnQ0d4c+uFtQUTXK+XQSj/2mpf7rZPaAs2dJgZaV1Z+HgS8tOIQNb9vlvp33y3trsc39Q
	 uJF102aFO7v5kLhQ3Simq2kzHh7sdPlY0Cg8kAF6kXMrevKyeSn23bG7W/QJumiGjJakd
	 iP2+tt9Gz4+LocFIlVuv+oQ92UTSR568Ro4LquruU/c/VIQsg3Is6Dft/Vu81j4P94A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kj9LEuOa;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqbTUzO2;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD3560A260D
	for <linux-arm-msm@vger.kernel.org>; Mon,  2 Nov 2026 08:15:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CD3560A260D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Kj9LEuOa;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RqbTUzO2
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A24w6Bc1262143
	for <linux-arm-msm@vger.kernel.org>; Mon, 2 Nov 2026 08:15:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=; b=Kj9LEuOamZeCgZkP
	4givCJdnYCchWqOH8jCoO3IExIQ7WToIZXnGcBnQ8ev3+zPBXJkcxAqIc24Pt/nK
	wZQZv0LlpAuRcBOrK47isX+5Pn9jzQOkx9SP/HsvWKJ0RJNwD9d/K1din4f1g8AD
	nDezlx3N3cGOsytIrd66vEwOSCtAkHfcQc2EuOYlrhUpnqU4eS21peFZs2GMAvft
	xqzVif96c9Bw72/5RTwLERmJOM4CTO23nWVDrcyPA29E3/flm1K4eBMhKTS0jc4d
	GZWL1fgS5FsN2VHWlCnHLWl7CqoOAV1KQzsgDBxEYr8wBhyhpXKxkKA61aV0GAef
	DMQ/xA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpky4gnn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 08:15:43 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8a0589ff620so1775638b3a.1
        for <linux-arm-msm@vger.kernel.org>; Mon, 02 Nov 2026 00:15:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793607343; x=1794212143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=;
        b=RqbTUzO2N4EMcJ/pUwul6Szd9ADjFFFhSoFlof8Y0nQyUnZYgThtACjssqg8OYgtUp
         duwf8wHStTcJfcSVNbkc9BdGDqanK52jN5dr5oUXGRbMfxOjQ/PeNI3agmitOsDy/s+B
         pfWt9ZrvGHctmkJLh5L7QXOd9H7xLyttD7RJ1u/Qw0mupIiQV90Id5qTeGBlHtJCYpjT
         nJBy6zSqtELBksJHOLgjGlKlarx7Li/H/aHwA4vRNFI3C1z4Hw5GTlGqiBIB+z6+grB3
         sEr/tAnHLdyBddwB2ES5+wCMzKW324UWTNOwOEHq97Dc9Bk2ICf0zhn/fir7xydHX9du
         hX9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793607343; x=1794212143;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yg1/YfsNebg1oVBiAZqRAo/GrAy95WMhji8WTMUGHuI=;
        b=R/hETTRyFFjke9RAAaSXkgPZu26kWEOMnGfkWo298q0mXiJy5LJYAxsiJfLQAcjoDv
         Tu3lUIyT/dQiOeAdtMYYAt8xmoWNTrZqf1lTD7ARQemri8HJWeVJfpNdYSurLGuTybEm
         pFhNCnHIJLgcMpKHOv0QR2NKjtYwng1G4nQ8ufk+vgrTECp/T85b6fygG8221rYbJAC4
         nT33LCZySvzLhtlhKBBjR8Xj39KryZgp09iFVHS9VpjIs9k0ejhI0hkUIezImgsvYkXA
         IR3GRPfMxWfhG7UDVG+lcRR9+Qn7/RKGRKTzD8btcyGrsDJCXbfSLebqW1BuzZALyVyY
         TiEA==
X-Forwarded-Encrypted: i=1; AKwUvBxSnBK6QJrUH4sMpN7FormGCRJ7S13+ZBu89q1+drtrAZtS9uBEcr1rVHMNQDEUOxBuyk4XNDC7p7q3CVAc@vger.kernel.org
X-Gm-Message-State: APuU4Z9NH3+eUr4SrbysexJTLs6UcM2PHVlpA7q0zwHHWbVn6J4wNxAz
	LduRh/LNOqVUZH9p4lA21McHD3j4chDYX241DwLhgOr11wwNVfR+YIRp7UM+nH7uHOFRjsawq0z
	LVYXzUBFw/kWxOp/c7wo94DuNJkz1IMe68paCkeC+/cXzho6CRhcuPZHat1ygQJF/Yxhhq+Zig7
	xb
X-Gm-Gg: AYBFou0NV/I+K0PNIruKtCqgyP44quf3nSUb9upX93mlJI9QxlMFSvKXE63AXGPjS+D
	0j0PUpmLzktqh//krzwAndEUbgtig8ODLapyb/k1hoqAi1zld6yIYR6ZzR4+Ue2sISRaL1oEWu8
	of9SX48Ll0nptaabfxhdnhXgpa51/YOgwyRGHXs1TN/pKGJl3MAX61OXSMPEv4sKaQfCR84NaZM
	awFBinuXp9//rKpySSzRUxrifRDrkqb0cdRTpL6VhPSL6QglJQIKspsJwWS6lnPOH7NAwYSSnHp
	9PjMzoQ3qE7HyWBIIrK/m8xosV06CyRgNKJoFs8pFO/uBSZo03m14oD9KF4tyHbXc6Uv4BrzQLE
	JkcjFbjHTfQOw/vzWUUD8ADxz1c10uZeZsONRxWoES67WS6y7GZmJnuCezGfZ9/qi7fXGWghVZm
	xfIQ==
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr7792372b3a.58.1793607342780;
        Mon, 02 Nov 2026 00:15:42 -0800 (PST)
X-Received: by 2002:a05:6a00:1c91:b0:89e:584:bb77 with SMTP id d2e1a72fcca58-8a9c098ab29mr7792341b3a.58.1793607342266;
        Mon, 02 Nov 2026 00:15:42 -0800 (PST)
Received: from [10.217.219.145] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aada3d3603sm1573291b3a.37.2026.11.02.00.15.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 00:15:41 -0800 (PST)
Message-ID: <9f7c605b-e7ec-49d9-85af-7dd9d00a9079@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 13:45:37 +0530
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
Subject: Re: [PATCH v1 1/2] phy: qcom: qmp-combo: Add PM suspend/resume
 callbacks
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>
References: <20261022104321.306679-1-prashanth.k@oss.qualcomm.com>
 <20261022104321.306679-2-prashanth.k@oss.qualcomm.com>
 <de3e5baf-dab5-417b-a9ed-225cbc56ce1a@oss.qualcomm.com>
 <a8104e92-990c-4e1a-aa4a-c97b9a801935@oss.qualcomm.com>
 <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
Content-Language: en-US
From: Prashanth K <prashanth.k@oss.qualcomm.com>
In-Reply-To: <a05ddb1a-a84b-4db0-9806-918958f3a962@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 7d2F2_UIns72hyKV6DzBgoQwWxD3ToIw
X-Proofpoint-GUID: 7d2F2_UIns72hyKV6DzBgoQwWxD3ToIw
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzMiBTYWx0ZWRfX6pzcF+fTHrPd
 eb6DlpoKAOKiCjZ0qQsXwCYc4ydxn7srSiD83c82QQPit3bGA2TrGewTdW3RfNxwIi5LbLKypeW
 V91lsQbUV/jLMLD/z1bp5vriMIneEf0=
X-Authority-Analysis: v=2.4 cv=QoHLTlyd c=1 sm=1 tr=0 ts=6ae846af cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=3tw5ZB9OoNIg3H-R3REA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzMiBTYWx0ZWRfX0L8PHF5P7vzB
 Ige/oc7vRLmPoTGDaPqARK39fewwN0qCh5VOQXK0wgrfqPJyzHVeQ+zTn9syOGTTTe3jJWjsR+X
 Bx6Fo69LXqyn5KDRBQ1T8HmgX4gHLilVDlpZ1FxuDrEBwmkZRk5wge0fxFVPN3E5pXAeRYR2bUm
 1YP0Tm7a4P3/Dub43HjncPUO4PugbSUCEoS6FHthXAufX1R/70wzeZlYGBBKdXopFqOVXPzAt7t
 nx54zoU34gH2hQ/kd0cIZwwRXP0oYwDXfTZVbSUa/JQGa6qNPXb17Cp75vU1jO1IyFaI245Za4r
 t3eH3HBZZtkSE+NWy/crMW/Rix1YPvKkuQhr1SwryfqTOt95xHDNrrIPWXzoTJxpMUQiS0jyX7W
 MUrK+XiPR2ci6AdqbGCFwVwBjEb1sz14ZofLwyQbxcBcr2QaKzO9uqXUf95KPq0T12hE3H2zVNu
 qnj687yhsGbr37Scuww==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020032



On 10/30/2026 6:54 PM, Konrad Dybcio wrote:
> On 10/29/26 7:11 AM, Prashanth K wrote:
>>
>>
>> On 10/23/2026 3:53 PM, Konrad Dybcio wrote:
>>> On 10/22/26 12:43 PM, Prashanth K wrote:
>>>> Currently when we perform system suspend, the phy clocks aren't
>>>> turned off leading to power leakage. Prevent this by adding PM
>>>> suspend/resume callbacks for the qmp-combo-phy which toggles
>>>> clocks on/off correspondingly.
>>>>
>>>> Signed-off-by: Prashanth K <prashanth.k@oss.qualcomm.com>
>>>> ---
>>>
>>> Well this still leaves pm_runtime_forbid() in the probe function..
>>>
>>
>> Not sure about the history behind this, I assume its for controlling RT
>> behavior from user-space.
> 
> Long story short it was an opt-in because it was broken.. can't recall
> if the issues were on the dwc3-qcom(-legacy) side or somewhere in the
> PHY code itself.
> 
> Konrad

ok, I'm not sure if we should modify it in this patch, I'll enable the
RT PM operations and check its behavior. But this patch is intended to
enable the system suspend/resume ops for qmp phy.

While at it, you had suggested to add mutex guard on RT operations,
I think we can add that also as a separate series since it needs
addition of mutex on qmp-usb driver.

Regards,
Prashanth K


