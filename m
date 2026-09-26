Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7D583DBD5E
	for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 09:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790416141; cv=none; b=jDy0N8fMkmvOSbm9ZIwLnRK4kFGFttiEtbBPEY/JfxrNSazwTt38+uTiOOPvmifQo6mekzAg6/cEP6R74PkRPvWcPlOXREQPCFsUEG1QKfbS+gG9WVgow6aCx8V7Xmhcw+zTaScT9ebXWEZhluSpu3wRZWGdXtKiGbHHWwY+xpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790416141; c=relaxed/simple;
	bh=v/V8ct7TOae2Ur01kAqamHgQFG4Ncm169q/vVbvSBT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Fa7hulqJx3ixStQQQboHnmOQWvn8CkKscHsAwMOY+h8UAs6U0VDRA8RI2waiJylhPJyOdilrwgF4dE5hy/SlMDqE7E/cLI/P1a/rKavCPMbUA+QeW/m5oSFQZ9klcIP3AollnVQE1YthjtGc9wBs7QSPqy3ur7WKp4X/irLNhVw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=j28rcUog; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="j28rcUog"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ffb83bf7aso2912415e9.2
        for <linux-arm-msm@vger.kernel.org>; Sat, 26 Sep 2026 02:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1790416138; x=1791020938; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=M/m7H+YAcykbCH5LdCzTmsHgpKE8tCQEwcEavkDXZfU=;
        b=j28rcUoghxg90ewTNM8oGB4t1Ey5IyWEHC5+vI0eHtlRwIKYaKpvdBUrIOASeCSpeN
         Z7FjHcctV1adj1RAR+hJ2W/Kmrnwf3VfQAVdQ+QpLnCug6y279C8lAsmPFeEY5b/R6/z
         ldtuG5DFskV6ebN8SjTOifEpDZXUP10wnZi6AfYINs14iZzSCjHS6yLrNc+1xHJNI+nY
         frk7QSL3EkZSHaUKatX31/7H0Oug5xCgwx77QFYAVhSGs3gFRX4tsV+mB7bKbz+G6/mu
         v6mhoKZw2D0xW8JmYJzftV5hQhUyuyYp8gsfbh5NWs70otpD4uDgs4Be4BH1Jc7bGX/D
         YH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790416138; x=1791020938;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M/m7H+YAcykbCH5LdCzTmsHgpKE8tCQEwcEavkDXZfU=;
        b=nMM5uCRl7MGXA+NOrhrk2bReJpnKfhYcbHHtxoYQAGlLzWccShZkIqo7Neo1B9eJHM
         jsBNxZu15B8quXPqdbLX68JaKjofUexiZHaqkcW8czNvL3w6nDLB+xa2Z5GAPQ0dpRq4
         SNn8SYKlkrjkfFhg/Jy+DuezG1tjpSeQX1yGx3D8wWdCAuu2pRLLStnVwZAohVf9L23V
         jhhqKkKZVNR9SeWh3EgRbhkz9RwMgABgLPdDNi+/Bb+TJ+jk/uorEriZsvQUKUzRAg3X
         fMgmux3RT5wC5FeSxDDSn1an4O5xgqZ18H59QPeakYP97HehSegOkhxsbpmEdzuib7iT
         7dFg==
X-Forwarded-Encrypted: i=1; AKwUvByork4/TOqfhFCCOejpxPrCeX3jKWfv8gb20odSu2cDVm5Zzw8lIpa13NKflbr9hsRH0fa7A7kH+YFPPEbv@vger.kernel.org
X-Gm-Message-State: AFuF++lsImcihfhlhGwOVCU97m6Hj/pywv4ndT7WnJZ/tfTPrUyEJ9Yc
	pvDtqDARHzQzSoDY/BUPnXYyhNZ0W4tCcavCF+hQq04GrI7YaFZuKIPlaZx2kj6ilsE=
X-Gm-Gg: AYBFou17Jx/shXm5PZHbJvq7zJkLJJnk9JntqjhkPFEIP8iWvZuFZ/04ILQdoLLfMP/
	LOcBvE9eXiz1b74ha0wz6MXvbF8AT7SV7lUeMySsjtvET2o9vegrlGMdvEM52jvUyDtIO/wHyCu
	csyQ29saRwYScFk4TdEi6cDcBeGMbY8kffgs2M6XMh7dnV3wBybQYdFi7V49BZ5YGD7X/8R2uGZ
	C/1HkFrr724yfHb4dB51yesoLsBSOWvnfNlFrVC40Bk5IqSyHsNna5wDzf8/0pDR1UEz5NoSEZx
	l2tuwLz673hgCBthvysKh9REH5cZFugiWU1q0NeT9jND5IoLmI5P7TVlS+o3Ufd093IZEVM5o8L
	7EbHB4wVHmBbCYne/yofulEJdDHP57jFoGdjExkrtfSxn9qd5AiYnKVHokGNKjYnrcsMGeufMA4
	oOhqgqImEcFb5IMcmkeh+XCj9uZQmQ+enEbZH4GVYc1XqJ3kSq2AQQJeCeIAYLlD0J70YF9x41w
	PappRoK14w=
X-Received: by 2002:a05:600c:4f42:b0:49f:bd3c:bc1b with SMTP id 5b1f17b1804b1-49fe66f5ddemr180741955e9.22.1790416137942;
        Sat, 26 Sep 2026 02:48:57 -0700 (PDT)
Received: from [192.168.0.167] ([109.77.79.156])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a354c47sm13800799f8f.15.2026.09.26.02.48.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Sep 2026 02:48:57 -0700 (PDT)
Message-ID: <88f8d5ec-5e3d-4867-bb7e-0f242250f4dc@linaro.org>
Date: Sat, 26 Sep 2026 10:48:56 +0100
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
List-Id: <linux-arm-msm.vger.kernel.org>
List-Subscribe: <mailto:linux-arm-msm+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-arm-msm+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/5] media: qcom: camss: fixes for several cameras
 behind a CSI-2 bridge
To: Hitesh Patel <hitesh@ebytelogic.com>, linux-media@vger.kernel.org
Cc: Bryan O'Donoghue <bod@kernel.org>,
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 ravi@ebytelogic.com
References: <20260915121557.20910-1-hitesh@ebytelogic.com>
 <20260925114511.2228661-1-hitesh@ebytelogic.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20260925114511.2228661-1-hitesh@ebytelogic.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 25/09/2026 12:45, Hitesh Patel wrote:
> Hi all,
> 
> Patchwork has just moved all five patches of this series from Under
> Review to Superseded, but there is no newer version: v2 is the latest
> one I sent, and I have not posted a v3.
> 
> I re-checked the series against next-20260924 today:
> 
>    - git am applies all five cleanly, no fuzz and no 3-way fallback
>    - each patch builds on its own with W=1 (arm64 defconfig +
>      CONFIG_VIDEO_QCOM_CAMSS=m), so the series is bisectable
>    - checkpatch --strict is clean on all five
> 
> so as far as I can tell the series is still current. 5/5 carries
> Bryan's Reviewed-by; 1/5 to 4/5 have not been reviewed yet.
> 
> Was the state change intentional? If you would like a resend rebased on
> current media master I will send a v3 right away; otherwise, could the
> patches be put back to Under Review so they stay in the queue?
> 
> Thanks,
> Hitesh

OK, sending a series as a response to an existing series is not clear 
what is the intent - particularly when the other series about 
multi-stream had inline patch responses to Gjorgi's patches.

If you intend for this to be evalulated as a series, send it as a series 
not as a response to an existing series.

Too confusing.

---
bod
